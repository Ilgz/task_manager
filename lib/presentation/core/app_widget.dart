import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/auth/auth_bloc.dart';
import 'package:task_manager/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:task_manager/application/projects/project_actor/project_actor_bloc.dart';
import 'package:task_manager/application/projects/project_filter/project_filter_bloc.dart';
import 'package:task_manager/application/projects/project_form/project_form_bloc.dart';
import 'package:task_manager/application/projects/project_watcher/project_watcher_bloc.dart';
import 'package:task_manager/injection.dart';
// import 'package:task_manager/application/notes/note_actor/note_actor_bloc.dart';
// import 'package:task_manager/application/notes/note_form/note_form_bloc.dart';
// import 'package:task_manager/application/notes/note_watcher/note_watcher_bloc.dart';
// import 'package:task_manager/injection.dart';
import 'package:task_manager/presentation/routes/router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<ProjectWatcherBloc>()..add(const ProjectWatcherEvent.startWatchAll()),
            ),
            BlocProvider(create: (context)=>getIt<ProjectFilterBloc>()),
            BlocProvider(
              create: (context) => getIt<ProjectActorBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<SignInFormBloc>(),
            ),
            BlocProvider(
              create: (context) =>
              getIt<AuthBloc>()..add(AuthEvent.authCheckRequested()),
            )
          ],
          child: MaterialApp.router(
              routerConfig: goRouter,
              title: 'Notes',
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light().copyWith(
                  primaryColor: Colors.green[800],
                  accentColor: Colors.blueAccent,
                  inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))))));
    }
  }
