import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/projects/project_actor/project_actor_cubit.dart';
import 'package:task_manager/domain/users/user.dart';
import 'package:task_manager/injection.dart';
import 'package:task_manager/presentation/core/constants.dart';
import 'package:task_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:task_manager/presentation/core/widgets/failure_snackbar.dart';
import 'package:task_manager/presentation/core/widgets/no_result_card.dart';
import 'package:task_manager/presentation/projects/widgets/project_card.dart';

class UserProjectsListPage extends StatelessWidget {
  const UserProjectsListPage({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<ProjectActorCubit>()..getUserProjects(user),
        ),
      ],
      child: BlocListener<ProjectActorCubit, ProjectActorState>(
        listener: (context, state) {
          state.maybeMap(
              getUserProjectsFailure: (state) {
                ScaffoldMessenger.of(context).showSnackBar(
                    FailureSnackBar(failure: state.projectFailure));
              },
              orElse: () {});
        },
        child: CustomScaffold(
          appBarTitle: user.userName.getOrCrash(),
          body: BlocBuilder<ProjectActorCubit, ProjectActorState>(
            buildWhen: (p, c) => c.maybeMap(
                loadingProgressState: (_) => true,
                getUserProjectsSuccess: (_) => true,
                orElse: () => false),
            builder: (context, state) {
              return state.maybeMap(
                  loadingProgressState: (_) => Center(
                      child: LinearProgressIndicator(
                          color:  Theme.of(context).primaryColor,
                  )),
                  getUserProjectsSuccess: (state) {
                    final projects = state.projectList;
                    if (projects.isNotEmpty) {
                      return LayoutBuilder(builder: (context, constraints) {
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  constraints.maxWidth > 700 ? 4 : 2,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 256,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: projects.length,
                            itemBuilder: (context, index) {
                              final project = projects[index];
                              if (project.failureOption.isSome() &&
                                  !project.isNew) {
                                return const Card(
                                  child: Text("Error"),
                                );
                              } else {
                                return ProjectCard(project: project);
                              }
                            });
                      });
                    } else {
                      return const NoResultCard(
                          "No projects found", Icons.account_tree_outlined);
                    }
                  },
                  orElse: () => SizedBox());
            },
          ),
        ),
      ),
    );
  }
}
