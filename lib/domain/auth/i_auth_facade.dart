import 'package:dartz/dartz.dart';
import 'package:task_manager/domain/auth/auth_failure.dart';
import 'package:task_manager/domain/core/user.dart';
import 'package:task_manager/domain/auth/value_objects.dart';

abstract class IAuthFacade{
  Option<String> getSignedInUser();
  Future<Either<AuthFailure,Unit>> registerWithEmailAndPassword({required EmailAddress emailAddress,required Password password});
  Future<Either<AuthFailure,Unit>> signInWithEmailAndPassword({required EmailAddress emailAddress,required Password password});
  Future<void> signOut();
}