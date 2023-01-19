import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/presentation/core/constants.dart';
import 'package:task_manager/presentation/core/scaffold_with_bottom.dart';
import 'package:task_manager/presentation/profile/profile_page.dart';
import 'package:task_manager/presentation/sign_in/sign_in_page.dart';
import 'package:task_manager/presentation/splash/splash_page.dart';
import 'package:task_manager/presentation/projects/projects_overview/projects_overview_page.dart';
import 'package:task_manager/presentation/users/users_overview/users_overview_page.dart';

  final goRouter = GoRouter(initialLocation: '/', routes: [
      ShellRoute(
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
      child: TasksOverviewPage(),
    ),
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

   void goToSignInPage(BuildContext context) =>
      context.go(AppTextConstants.signInPage);
  void goToUsersOverviewPage(BuildContext context) =>
      context.go(AppTextConstants.usersOverviewPage);
