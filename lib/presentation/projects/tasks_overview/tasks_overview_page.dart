import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/projects/project_creator/project_creator_bloc.dart';
import 'package:task_manager/application/projects/project_watcher/project_watcher_bloc.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/project_failure.dart';
import 'package:task_manager/domain/projects/task.dart';
import 'package:task_manager/presentation/core/constants.dart';
import 'package:task_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:task_manager/presentation/projects/widgets/critical_failure_display.dart';
import 'package:task_manager/presentation/projects/widgets/task_card.dart';
class TasksOverviewPage extends StatelessWidget {
  const TasksOverviewPage({Key? key, required this.initialProject}) : super(key: key);
  final Project initialProject;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ProjectCreatorBloc(),
  child: CustomScaffold(
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(context,
                //
                //     PageRouteBuilder(transitionDuration:Duration.zero,reverseTransitionDuration:Duration.zero,pageBuilder: (context,animation1,animation2) => MembersScreen(task)));
              },
              icon: Icon(Icons.more_horiz_outlined))
        ],
        appBarTitle: initialProject.projectName.getOrCrash(),
        isScrolling: true,
        floatingActionButton: initialProject.canBeModifiedAndIsAdmin.fold(() => null, (isAdmin) =>isAdmin?SizedBox(
          height: 50,
          width: 50,
          child: Builder(
            builder: (context) {
              return FloatingActionButton(
                backgroundColor: AppConstants.secondaryColor,
                onPressed: () {
                  context.read<ProjectCreatorBloc>().add(
                      ProjectCreatorEvent.startTaskForm());
                },
                child: const Icon(Icons.add),
              );
            }
          ),
        ):null),
        body:  BlocBuilder<ProjectWatcherBloc, ProjectWatcherState>(
  builder: (context, state) {
    return state.map(                  initial: (_) => const SizedBox(),
         loadInProgress: (_)=>const Center(child: CircularProgressIndicator()), loadSuccess: (state){
          List<Task> tasks=state.projects.firstWhere((project) => project.reference.path==initialProject.reference.path,orElse: (){throw ProjectFailure.unexpected();}).tasks.toList();
          tasks
              .sort((a, b) => a.date.compareTo(b.date));
          return Center(
      child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 20,
        ),
    BlocBuilder<ProjectCreatorBloc, ProjectCreatorState>(
      buildWhen: (p,c)=>p.taskFormIsActive!=c.taskFormIsActive,
      builder: (context, state) {
        if(state.taskFormIsActive){
          tasks.add(Task.empty());
        }else{
          if(tasks.isNotEmpty&&tasks.last.isNew==true){
            tasks.removeLast();
          }
        }
    return ListView.builder(shrinkWrap: true,itemCount:tasks.length,itemBuilder: (context,index){
          final task=tasks[index];
          return TaskCard(initialTask: task,documentReference: initialProject.reference,);
        });
  },
)
      ],
    ),
    );}, loadFailure: (state) {
      return CriticalFailureDisplay(
        failure: state.projectFailure,
      );
    });

  },
)),
);
  }
}
