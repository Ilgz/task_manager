import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/projects/project_watcher/project_watcher_bloc.dart';
import 'package:task_manager/presentation/projects/widgets/critical_failure_display.dart';

class TasksOverviewPage extends StatelessWidget {
  const TasksOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProjectWatcherBloc,ProjectWatcherState>(
        builder: (context,state){
         return state.map(initial: (_)=>SizedBox(), loadInProgress: (_)=>Center(child:CircularProgressIndicator()), loadSuccess: (state)=>Center(child: Text(state.projects.first.taskName.getOrCrash()),), loadFailure: (state)=>CriticalFailureDisplay(failure:state.projectFailure ));
        },
      ),
    );
  }
}
