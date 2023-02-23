import 'package:dartz/dartz.dart' hide Task;
import 'package:task_manager/domain/users/user.dart';
import 'package:task_manager/domain/users/user_failure.dart';

abstract class IUserRepository {
  Stream<Either<UserFailure, List<User>>> watchAllUsers();
}
