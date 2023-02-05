import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/projects/project_watcher/project_watcher_bloc.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/presentation/chat/widgets/chat_card.dart';
import 'package:task_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:task_manager/presentation/core/widgets/no_result_card.dart';
import 'package:task_manager/presentation/projects/widgets/critical_failure_display.dart';

class ChatsOverviewPage extends StatelessWidget {
const ChatsOverviewPage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return CustomScaffold(
      appBarTitle: "Чат",
      body: BlocBuilder<ProjectWatcherBloc, ProjectWatcherState>(
        builder: (context, state) {
          return state.map(
              initial: (_) => const SizedBox(),
              loadInProgress: (_) =>
              const Center(child: CircularProgressIndicator()),
              loadSuccess: (state) {
                    List<Project> projects = state.projects.toList();
                    projects
                        .sort((a, b) {
                          final aTimeStamp=a.messages.isEmpty?a.date:a.messages.last.date;
                          final bTimeStamp=b.messages.isEmpty?b.date:b.messages.last.date;
                     return  bTimeStamp.compareTo(aTimeStamp);});
                        if(projects.isNotEmpty){
                          return LayoutBuilder(
                              builder: (context, constraints) {
                                return ListView.builder(
                                    itemCount: projects.length,
                                    itemBuilder: (context, index) {
                                      final project = projects[index];
                                      if (project.failureOption.isSome()&&!project.isNew) {
                                        return const Card(
                                          child: Text("Error"),
                                        );
                                      } else {
                                        return ChatCard(project: project);
                                      }
                                    });
                              });
                        }else{
                          return  const NoResultCard("No chat found", Icons.account_tree_outlined);
                        }
              },
              loadFailure: (state) {
                return ProjectCriticalFailureDisplay(
                  failure: state.projectFailure,
                );
              });
        },
      ),
      );
}
}