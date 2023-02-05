import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/auth/auth_bloc.dart';
import 'package:task_manager/application/auth/profile_watcher/profile_watcher_cubit.dart';
import 'package:task_manager/application/projects/project_watcher/project_watcher_bloc.dart';
import 'package:task_manager/presentation/core/routes/router.dart';
import 'package:task_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:task_manager/presentation/profile/widgets/theme_switcher.dart';
import 'package:task_manager/presentation/projects/widgets/critical_failure_display.dart';
import 'package:task_manager/presentation/users/users_overview/widgets/user_icon.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProfileWatcherCubit>().getSignedInUser();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeMap(
            unAuthenticated: (_) {
              goToSignInPage(context);
            },
            orElse: () {});
      },
      child: BlocBuilder<ProfileWatcherCubit, ProfileWatcherState>(
        builder: (context, state) {
          return state.map(
              initial: (_) => const SizedBox(),
              loading: (_) => const Center(child: CircularProgressIndicator()),
              getSignedInUserSuccess: (state) {
                final user = state.user;
                return CustomScaffold(
                  actions: const [
                    ThemeSwitcher(),
                    SizedBox(width: 10,)
                  ],
                  appBarTitle: user.userName.getOrCrash(),
                  body: BlocBuilder<ProjectWatcherBloc, ProjectWatcherState>(
                    builder: (context, state) {
                      return state.map(
                          initial: (_) => const SizedBox(),
                          loadInProgress: (_) =>
                              const Center(child: CircularProgressIndicator()),
                          loadSuccess: (state) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Active projects\n${state.projects.length}",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                    UserIcon(
                                      user.userName.getOrCrash(),
                                      size: 70,
                                    ),
                                    Text(
                                      "Finished projects\n0",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  user.emailAddress.getOrCrash(),
                                  style: Theme.of(context).textTheme.titleLarge
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                ElevatedButton(
                                  style: Theme.of(context).elevatedButtonTheme.style,
                                  onPressed: () {
                                    context
                                        .read<AuthBloc>()
                                        .add(AuthEvent.signedOut());
                                  },
                                  child: Text(
                                    "Logout",
                                  ),
                                ),
                              ],
                            );
                          },
                          loadFailure: (state) {
                            return ProjectCriticalFailureDisplay(
                              failure: state.projectFailure,
                            );
                          });
                    },
                  ),
                );
              },
              getSignedInUserFailure: (_) => SizedBox());
        },
      ),
    );
  }
}
