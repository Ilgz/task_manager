import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/application/auth/auth_bloc.dart';
import 'package:task_manager/application/projects/project_filter/project_filter_bloc.dart';
import 'package:task_manager/application/projects/project_form/project_form_bloc.dart';
import 'package:task_manager/application/projects/project_watcher/project_watcher_bloc.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/value_objects.dart';
import 'package:task_manager/injection.dart';
import 'package:task_manager/presentation/core/constants.dart';
import 'package:task_manager/presentation/core/enums.dart';
import 'package:task_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:task_manager/presentation/core/widgets/no_result_card.dart';
import 'package:task_manager/presentation/core/widgets/responsive_gridview.dart';
import 'package:task_manager/presentation/projects/widgets/add_project_dialog.dart';
import 'package:task_manager/presentation/projects/widgets/critical_failure_display.dart';
import 'package:task_manager/presentation/projects/widgets/project_card.dart';

class ProjectsOverviewPage extends StatelessWidget {
  const ProjectsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProjectWatcherBloc>().add(const ProjectWatcherEvent.startWatchAll());
    return CustomScaffold(
        appBarTitle: "Проекты",
        actions: [
          BlocBuilder<ProjectFilterBloc, ProjectFilterState>(
            builder: (context, state) {
              return DropdownButtonHideUnderline(
                child: DropdownButton(
                  focusColor: Colors.transparent,
                  alignment: Alignment.centerRight,
                  selectedItemBuilder: (context) {
                    return ProjectFilterType.values
                        .map((ProjectFilterType value) {
                      return Center(
                        child: Text(
                          value.description,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList();
                  },
                  icon: Icon(
                    Icons.expand_more_outlined,
                    color: Colors.white,
                  ),
                  value: state.type,
                  items: <DropdownMenuItem<ProjectFilterType>>[
                    DropdownMenuItem(
                      value: ProjectFilterType.all,
                      child: Text(ProjectFilterType.all.description),
                    ),
                    DropdownMenuItem(
                        value: ProjectFilterType.my,
                        child: Text(ProjectFilterType.my.description)),
                    DropdownMenuItem(
                        value: ProjectFilterType.participating,
                        child: Text(
                            ProjectFilterType.participating.description)),
                  ],
                  onChanged: (newVal) {
                    context
                        .read<ProjectFilterBloc>()
                        .add(ProjectFilterEvent.changeFilter(newVal!));
                  },
                ),
              );
            },
          )
        ],
        body: BlocBuilder<ProjectWatcherBloc, ProjectWatcherState>(
          builder: (context, state) {
            return state.map(
                initial: (_) => const SizedBox(),
                loadInProgress: (_) =>
                const Center(child: CircularProgressIndicator()),
                loadSuccess: (projectWatcherState) {
                  return BlocBuilder<ProjectFilterBloc, ProjectFilterState>(
                    builder: (context, typeState) {
                      var projects=sortProjectByDateAndType(projectWatcherState.projects.toList(), typeState);
                      return projects.isNotEmpty?
                      ResponsiveGridView(minCount: 2, maxCount: 4, itemHeight: 256, items: projects,itemBuilder: (project){
                        if (project.failureOption.isSome()&&!project.isNew) {
                          return const Card(
                            child: Text("Error"),
                          );
                        } else {
                          return ProjectCard(project: project);
                        }
                      },)

                        :
                      const NoResultCard("No projects found", Icons.account_tree_outlined);
                    },
                  );
                },
                loadFailure: (state) {
                  return ProjectCriticalFailureDisplay(
                    failure: state.projectFailure,
                  );
                });
          },
        ),
        floatingActionButton:
         FloatingActionButton(onPressed: () {
               showModalBottomSheet(context: context,isScrollControlled:true,builder: (context){
                 return const AddProjectDialog();
               });
          }, child: Icon(Icons.add,color: Colors.white,))
       );
  }
  List<Project> sortProjectByDateAndType(List<Project> projects,ProjectFilterState typeState){
    projects
        .sort((a, b) => a.date.compareTo(b.date));
    if(typeState.type==ProjectFilterType.my){
      projects=projects.where((project) => project.canBeModifiedAndIsAdmin.fold(() => false, id )).toList();
    }else if(typeState.type==ProjectFilterType.participating){
      projects=projects.where((project) => project.canBeModifiedAndIsAdmin.fold(() => false,(isAdmin)=>!isAdmin )).toList();
    }
    return projects;
  }
}
