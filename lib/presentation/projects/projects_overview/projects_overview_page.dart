import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/application/auth/auth_bloc.dart';
import 'package:task_manager/application/projects/project_creator/project_creator_bloc.dart';
import 'package:task_manager/application/projects/project_filter/project_filter_bloc.dart';
import 'package:task_manager/application/projects/project_form/project_form_bloc.dart';
import 'package:task_manager/application/projects/project_watcher/project_watcher_bloc.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/value_objects.dart';
import 'package:task_manager/presentation/core/constants.dart';
import 'package:task_manager/presentation/core/enums.dart';
import 'package:task_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:task_manager/presentation/projects/widgets/critical_failure_display.dart';
import 'package:task_manager/presentation/projects/widgets/project_card.dart';

class ProjectsOverviewPage extends StatelessWidget {
  const ProjectsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ProjectCreatorBloc(),
  child: MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeMap(
                unAuthenticated: (_) =>
                    context.pushReplacement(AppTextConstants.signInPage),
                orElse: () {});
          },
        ),
        // BlocListener<NoteActorBloc, NoteActorState>(
        //   listener: (context, state) {
        //     state.maybeMap(
        //         deleteFailure: (state) {
        //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //               content: Text(state.noteFailure.map(
        //                   unexpected: (_) =>
        //                   "Unexpected error while deleting...",
        //                   insufficientPermission: (_) =>
        //                   "Insufficient permissions 👩",
        //                   unableToUpdate: (_) => "Impossible Error"))));
        //         },
        //         orElse: () {});
        //   },
        // ),
      ],
      child: CustomScaffold(
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
                            style: const TextStyle(color: Colors.white),
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
                  loadSuccess: (state) {
                    return BlocBuilder<ProjectFilterBloc, ProjectFilterState>(
                      builder: (context, typeState) {
                        List<Project> projects = state.projects.toList();
                        projects
                            .sort((a, b) => a.date.compareTo(b.date));
                        //TODO filtering
                        // if(typeState.type==ProjectFilterType.my){
                        //   projects.where((project) => project.canBeModifiedAndIsAdmin.fold(() => true, id ));
                        // }
                        return BlocBuilder<ProjectCreatorBloc, ProjectCreatorState>(
                          buildWhen: (p,c)=>p.projectFormIsActive!=c.projectFormIsActive,
                          builder: (context, state) {
                            if(state.projectFormIsActive){
                              projects.add(Project.empty());
                            }else{
                              if(projects.isNotEmpty&&projects.last.isNew==true){
                                projects.removeLast();
                              }
                            }
                            return LayoutBuilder(
                                builder: (context, constraints) {
                                  return GridView.builder(
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: constraints.maxWidth >
                                            700
                                            ? 4
                                            : 2,
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: 256,
                                        crossAxisSpacing: 10,
                                      ),
                                      itemCount: projects.length,
                                      itemBuilder: (context, index) {
                                        final project = projects[index];
                                        if (project.failureOption.isSome()&&!project.isNew) {
                                          return Card(
                                            child: Text("Error"),
                                          );
                                        } else {
                                          return ProjectCard(project: project);
                                        }
                                      });
                                });
                          },
                        );
                      },
                    );
                  },
                  loadFailure: (state) {
                    return CriticalFailureDisplay(
                      failure: state.projectFailure,
                    );
                  });
            },
          ),
          floatingActionButton:
          Builder(builder: (context){
           return FloatingActionButton(onPressed: () {
              context.read<ProjectCreatorBloc>().add(
                  ProjectCreatorEvent.startProjectForm());
            }, child: Icon(Icons.add));
          },
          )),
    ),
);
  }
}
