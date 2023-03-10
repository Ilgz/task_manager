import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/projects/project_watcher/project_watcher_bloc.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/task.dart';
import 'package:task_manager/presentation/core/routes/router.dart';
import 'package:task_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:task_manager/presentation/core/widgets/no_result_card.dart';
import 'package:task_manager/presentation/core/widgets/responsive_gridview.dart';
import 'package:task_manager/presentation/projects/widgets/add_task_dialog.dart';
import 'package:task_manager/presentation/projects/widgets/critical_failure_display.dart';
import 'package:task_manager/presentation/projects/widgets/task_card.dart';

class TasksOverviewPage extends StatelessWidget {
  const TasksOverviewPage({Key? key, required this.initialProject})
      : super(key: key);
  final Project initialProject;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        actions: [
          IconButton(
              onPressed: () {
                goToMembersPage(context, initialProject);
              },
              icon: const Icon(Icons.more_horiz_outlined))
        ],
        appBarTitle: initialProject.projectName.getOrCrash(),
        floatingActionButton: initialProject.canBeModifiedAndIsAdmin.fold(
            () => null,
            (isAdmin) => isAdmin
                ? SizedBox(
                    height: 50,
                    width: 50,
                    child: Builder(builder: (context) {
                      return FloatingActionButton(
                        onPressed: () {
                          showModalBottomSheet(context: context,isScrollControlled:true,builder: (context){
                            return AddTaskDialog(documentReference: initialProject.reference);
                          });
                        },
                        child: const Icon(Icons.add,color: Colors.white,),
                      );
                    }),
                  )
                : null),
        body: BlocBuilder<ProjectWatcherBloc, ProjectWatcherState>(
          builder: (context, state) {
            return state.map(
                initial: (_) => const SizedBox(),
                loadInProgress: (_) =>
                    const Center(child: CircularProgressIndicator()),
                loadSuccess: (state) {
                  final project = getLatestProject(state.projects);
                  final List<Task> tasks =
                      sortTasksAndRemoveDuplicatesByDate(project);
                      if (tasks.isNotEmpty) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            ResponsiveGridView( items: tasks,itemBuilder: (task){
                              return TaskCard(
                                initialTask: task,
                                project: project,
                              );
                            },),
                          ],
                        );
                      } else {
                        //  return Expanded(child: Container(color: Colors.red,width: double.infinity,height: double.infinity,));
                        return const NoResultCard(
                            "No tasks found", Icons.assignment);
                      }

                },
                loadFailure: (state) {
                  return ProjectCriticalFailureDisplay(
                    failure: state.projectFailure,
                  );
                });
          },
        ));
  }

  List<Task> sortTasksAndRemoveDuplicatesByDate(Project project) {
    List<Task> tasks = project.tasks.toList();
    tasks.sort((a, b) => a.date.compareTo(b.date));
    for (int i = 0; i < tasks.length; i++) {
      if (i != tasks.length - 1) {
        if (tasks[i].date == tasks[i + 1].date) {
          tasks.removeAt(i);
        }
      }
    }

    return tasks;
  }

  Project getLatestProject(List<Project> projects) {
    return projects.firstWhere(
        (project) => project.reference.path == initialProject.reference.path,
        orElse: () => initialProject);
  }
}
