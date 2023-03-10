import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/auth/auth_bloc.dart';
import 'package:task_manager/application/auth/profile_watcher/profile_watcher_cubit.dart';
import 'package:task_manager/application/chat/chat_form_bloc/chat_form_bloc.dart';
import 'package:task_manager/application/core/theme_switcher/theme_switcher_cubit.dart';
import 'package:task_manager/application/projects/project_filter/project_filter_bloc.dart';
import 'package:task_manager/application/projects/project_watcher/project_watcher_bloc.dart';
import 'package:task_manager/application/users/user_watcher/user_watcher_bloc.dart';
import 'package:task_manager/injection.dart';
import 'package:task_manager/presentation/core/constants.dart';
import 'package:task_manager/presentation/core/routes/router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<ThemeSwitcherCubit>()..initializeTheme()),
          BlocProvider(
            create: (context) => getIt<ProjectWatcherBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<UserWatcherBloc>(),
          ),
          BlocProvider(create: (context) => getIt<ProjectFilterBloc>()),
          BlocProvider(create: (context) => getIt<ProfileWatcherCubit>()),
          BlocProvider(create: (context) => getIt<ChatFormBloc>()),
          BlocProvider(
            create: (context) =>
                getIt<AuthBloc>()..add(AuthEvent.authCheckRequested()),
          )
        ],
        child: BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
          buildWhen: (p, c) => p.isDark != c.isDark,
          builder: (context, state) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                statusBarColor:state.isDark?AppColorConstants.darkPrimaryColor:AppColorConstants.lightPrimaryColor, // set your desired status bar color here
              ),
              child: MaterialApp.router(
                  routerConfig: goRouter,
                  title: "TaskManager",
                  debugShowCheckedModeBanner: false,
                  themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
                  darkTheme: darkTheme,
                  theme: lightTheme),
            );
          },
        ));
  }
}

// Light mode
final lightTheme = ThemeData(
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: Colors.black),
  dividerColor: Colors.black,
  primaryColor: AppColorConstants.lightPrimaryColor,
  scaffoldBackgroundColor: AppColorConstants.lightScaffoldBackgroundColor,
  textTheme: TextTheme(
    caption: TextStyle(
      fontSize: 14,
      color: Colors.grey.shade600,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(180, 40)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(
              AppColorConstants.lightPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          )))),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorConstants.lightPrimaryColor),
);

// Dark mode
final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColorConstants.darkPrimaryColor,
    dividerColor: Colors.white70,
    textTheme: TextTheme(
      caption: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade300,
      ),
    ),

    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: AppColorConstants.darkScaffoldBackgroundColor,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.green),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(180, 40)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
                AppColorConstants.darkPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )))));
