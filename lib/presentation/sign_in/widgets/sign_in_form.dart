import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/application/auth/auth_bloc.dart';
import 'package:task_manager/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:task_manager/presentation/routes/router.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
          return Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: ListView(
                padding: EdgeInsets.all(8),
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    autocorrect: false,
                    validator: (_) =>
                        context
                            .read<SignInFormBloc>()
                            .state
                            .emailAddress
                            .value
                            .fold(
                                (f) =>
                                f.maybeMap(
                                    invalidEmail: (value) => 'Invalid email',
                                    orElse: () => null),
                                (r) => null),
                    onChanged: (value) =>
                        context
                            .read<SignInFormBloc>()
                            .add(SignInFormEvent.emailChanged(value)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                    autocorrect: false,
                    onChanged: (value) =>
                        context
                            .read<SignInFormBloc>()
                            .add(SignInFormEvent.passwordChanged(value)),
                    obscureText: true,
                    validator: (_) =>
                        context
                            .read<SignInFormBloc>()
                            .state
                            .password
                            .value
                            .fold(
                                (f) =>
                                f.maybeMap(
                                    shortPassword: (value) => 'Short password',
                                    orElse: () => null),
                                (r) => null),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextButton(
                              onPressed: () {
                                context.read<SignInFormBloc>().add(
                                    SignInFormEvent
                                        .signInWithEmailAndPasswordPressed());
                              },
                              child: Text("Sign In"))),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: TextButton(
                              onPressed: () {
                                context.read<SignInFormBloc>().add(
                                    SignInFormEvent
                                        .registerWithEmailAndPasswordPressed());
                              },
                              child: Text("Sign Up"))),
                    ],
                  ),
                  if (state.isSubmitting) ...[
                    const SizedBox(
                      height: 8,
                    ),
                    const LinearProgressIndicator(
                      value: null,
                    )
                  ]
                ],
              ));
        }, listener: (context, state) {
      state.authFailureSuccessOption.fold(
              () => () {},
              (either) =>
              either.fold(
                      (failure) =>
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(failure.map(
                              cancelledByUser: (_) => "Cancelled",
                              serverError: (_) => "Server error",
                              emailAlreadyInUse: (_) => "Email already in use",
                              invalidEmailAndPassword: (_) =>
                              "Invalid email and password combination")))),
                      (r) {
                        goToUsersOverviewPage(context);
                    context.read<AuthBloc>().add(AuthEvent.authCheckRequested());
                  }));
    });
  }
}
