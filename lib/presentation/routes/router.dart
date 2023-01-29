import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/task.dart';
import 'package:task_manager/presentation/core/constants.dart';
import 'package:task_manager/presentation/core/scaffold_with_bottom.dart';
import 'package:task_manager/presentation/profile/profile_page.dart';
import 'package:task_manager/presentation/projects/tasks_overview/tasks_overview_page.dart';
import 'package:task_manager/presentation/sign_in/sign_in_page.dart';
import 'package:task_manager/presentation/splash/splash_page.dart';
import 'package:task_manager/presentation/projects/projects_overview/projects_overview_page.dart';
import 'package:task_manager/presentation/users/users_overview/users_overview_page.dart';
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
  final goRouter = GoRouter(navigatorKey: _rootNavigatorKey,initialLocation: '/', routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
return ScaffoldWithBottomNavBar(child: child);
},
routes:[

  GoRoute(
    path: AppTextConstants.usersOverviewPage,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: UsersOverviewPage(),
    ),
  ),
  GoRoute(
    path: AppTextConstants.projectsOverviewPage,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: ProjectsOverviewPage(),
    ),
    routes: [
      GoRoute(      parentNavigatorKey: _rootNavigatorKey,
        path: AppTextConstants.tasksOverviewPage,pageBuilder: (context, state) =>  NoTransitionPage(
        child: TasksOverviewPage(initialProject: state.extra as Project),
      ), )
    ]
  ),
  GoRoute(
    path: AppTextConstants.profilePage,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: ProfilePage(),
    ),
  ),
]),
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SplashPage(),
      ),

    ),
    GoRoute(
      path: AppTextConstants.signInPage,

      pageBuilder: (context, state) => const NoTransitionPage(

        child: SignInPage(),
      ),
    ),

  ]);
void goToTasksOverviewPage(BuildContext context,Project project) =>
    context.go("${AppTextConstants.projectsOverviewPage}/${AppTextConstants.tasksOverviewPage}",extra: project);
   void goToSignInPage(BuildContext context) =>
      context.go(AppTextConstants.signInPage);
  void goToUsersOverviewPage(BuildContext context) =>
      context.go(AppTextConstants.usersOverviewPage);
