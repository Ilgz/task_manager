import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:injectable/injectable.dart';
import 'package:task_manager/domain/core/errors.dart';
import 'package:task_manager/domain/users/i_user_repository.dart';
import 'package:task_manager/domain/users/user.dart';
import 'package:task_manager/domain/users/user_failure.dart';
import 'package:task_manager/infrastructure/core/firestore_helpers.dart';
import 'package:task_manager/infrastructure/users/user_dto.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  UserRepository(this._firebaseFirestore, this._firebaseAuth);

  @override
  Stream<Either<UserFailure, List<User>>> watchAllUsers() async* {
    final userOption = optionOf(_firebaseAuth.currentUser?.email);
    final userEmail = userOption.getOrElse(() => throw NotAuthenticatedError());
    yield* _firebaseFirestore.userCollection.where("email",
        isNotEqualTo: userEmail).
        snapshots()
        .map((users) => right(users.docs.map((user) => UserDto.fromFirestore(user).toDomain()).toList()));
  }
}
