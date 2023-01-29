import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:task_manager/domain/auth/i_auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  AuthBloc(this._authFacade) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) async{
    await  event.map(authCheckRequested: (e)async{
      final userOption=await _authFacade.getSignedInUser();
             emit(userOption.fold(()=>AuthState.unAuthenticated(),(_)=>AuthState.authenticated()));
      }, signedOut: (e)async{
      print("workedBloc");
           await _authFacade.signOut();
           emit(AuthState.unAuthenticated());
      });
    });
  }
}
