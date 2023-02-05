import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/users/user.dart';
import 'package:task_manager/presentation/chat/chat_page.dart';
import 'package:task_manager/presentation/chat/chats_overview_page.dart';
import 'package:task_manager/presentation/core/constants.dart';
import 'package:task_manager/presentation/core/widgets/scaffold_with_bottom.dart';
import 'package:task_manager/presentation/profile/profile_page.dart';
import 'package:task_manager/presentation/projects/projects_overview/projects_overview_page.dart';
import 'package:task_manager/presentation/projects/tasks_overview/tasks_overview_page.dart';
import 'package:task_manager/presentation/projects/user_projects_list/user_projects_list_page.dart';
import 'package:task_manager/presentation/sign_in/sign_in_page.dart';
import 'package:task_manager/presentation/sign_in/sign_up_page.dart';
import 'package:task_manager/presentation/splash/splash_page.dart';
import 'package:task_manager/presentation/users/members_overview/members_page.dart';
import 'package:task_manager/presentation/users/users_overview/users_overview_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final goRouter =
    GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: '/', routes: [
  ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithBottomNavBar(child: child);
      },
      routes: [
        GoRoute(
            redirect: (context, state) {
              if (state.extra == null) {
                return PageRoutes.usersOverviewPage;
              }
              return null;
            },
            path: PageRoutes.usersOverviewPage,
            pageBuilder: (context, state) => const NoTransitionPage(
                  child: UsersOverviewPage(),
                ),
            routes: [
              GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: PageRoutes.userProjectsListPage,
                  pageBuilder: (context, state) => NoTransitionPage(
                          child: UserProjectsListPage(
                        user: state.extra as User,
                      )))
            ]),
        GoRoute(
            redirect: (context, state) {
              if (state.extra == null) {
                return PageRoutes.projectsOverviewPage;
              }
              return null;
            },
            path: PageRoutes.projectsOverviewPage,
            pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProjectsOverviewPage(),
                ),
            routes: [
              GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,

                  path: PageRoutes.tasksOverviewPage,
                  pageBuilder: (context, state) => NoTransitionPage(
                        child: TasksOverviewPage(
                            initialProject: state.extra as Project),
                      ),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: PageRoutes.membersPage,
                      pageBuilder: (context, state) => MaterialPage(fullscreenDialog: true,
                        child:
                            MembersPage(initialProject: state.extra as Project),
                      ),
                    ),
                  ]),
            ]),
        GoRoute(
            redirect: (context, state) {
              if (state.extra == null) {
                return PageRoutes.chatsOverviewPage;
              }
              return null;
            },
          path: PageRoutes.chatsOverviewPage,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ChatsOverviewPage(),
          ),
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: PageRoutes.chatPage,
              pageBuilder: (context, state) =>  NoTransitionPage(
                child: ChatPage(initialProject: state.extra as Project,),
              ),
            ),
          ]
        ),
        GoRoute(
          path: PageRoutes.profilePage,
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
    path: PageRoutes.signInPage,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: SignInPage(),
    ),
  ),
  GoRoute(
    path: PageRoutes.signUpPage,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: SignUpPage(),
    ),
  ),
]);

void goToMembersPage(BuildContext context, Project project) => context.push(
    "${PageRoutes.projectsOverviewPage}/${PageRoutes.tasksOverviewPage}/${PageRoutes.membersPage}",
    extra: project);

void goToTasksOverviewPage(BuildContext context, Project project) => context.push(
    "${PageRoutes.projectsOverviewPage}/${PageRoutes.tasksOverviewPage}",
    extra: project);

void goToSignInPage(BuildContext context) =>
    context.pushReplacement(PageRoutes.signInPage,);
void goToChatsOverviewPage(BuildContext context) =>
    context.push(PageRoutes.chatsOverviewPage);
void goToChatPage(BuildContext context,Project project) =>
    context.push("${PageRoutes.chatsOverviewPage}/${PageRoutes.chatPage}",extra: project);
void goToSignUpPage(BuildContext context) =>
    context.pushReplacement(PageRoutes.signUpPage);
void goToUsersOverviewPage(BuildContext context) =>
    context.go(PageRoutes.usersOverviewPage);
void goToUserProjectsListPage(BuildContext context,User user) =>
    context.push("${PageRoutes.usersOverviewPage}/${PageRoutes.userProjectsListPage}",extra: user);