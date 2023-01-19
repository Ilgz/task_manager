import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager/domain/auth/auth_failure.dart';
import 'package:task_manager/domain/auth/i_auth_facade.dart';
import 'package:task_manager/domain/auth/value_objects.dart';

part 'sign_in_form_bloc.freezed.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';
@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async{
      await event.map(
          emailChanged: (e) {
            emit(state.copyWith(emailAddress: EmailAddress(e.emailStr),authFailureSuccessOption: none()));
          },
          passwordChanged: (e) {
            emit(state.copyWith(password: Password(e.passwordStr),authFailureSuccessOption: none()));
          },
          registerWithEmailAndPasswordPressed: (e) async{
           await _performActionOnAuthFacadeWithEmailAndPassword(emit, _authFacade.registerWithEmailAndPassword);
           },
          signInWithEmailAndPasswordPressed: (e)async {
          await  _performActionOnAuthFacadeWithEmailAndPassword(emit,_authFacade.signInWithEmailAndPassword);
          },
          );
    });
  }
  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(Emitter<SignInFormState> emit,
      Future<Either<AuthFailure, Unit>> Function({required EmailAddress emailAddress, required Password password}) forwardedCall
      )async{
    Either<AuthFailure,Unit>? failureOrSuccess;
    final isEmailValid=state.emailAddress.isValid();
    final isPasswordValid=state.password.isValid();
    if(isEmailValid&&isPasswordValid){
      emit(state.copyWith(isSubmitting: true,authFailureSuccessOption: none()));
      failureOrSuccess=await forwardedCall(emailAddress: state.emailAddress, password: state.password);
    }
    emit(state.copyWith(showErrorMessages: true,isSubmitting:false,authFailureSuccessOption: optionOf(failureOrSuccess)));

  }
}