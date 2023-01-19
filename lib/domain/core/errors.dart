import 'package:task_manager/domain/core/failures.dart';

class NotAuthenticatedError extends Error{}
class UnexpectedValueError extends Error{
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);
@override
  String toString() {
    // TODO: implement toString
    return "Encountered a valueFailure at an unrecoverable point. Terminating. Failure was: $valueFailure";
  }
}