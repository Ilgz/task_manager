import 'package:dartz/dartz.dart';
import 'package:task_manager/domain/core/failures.dart';
import 'package:task_manager/domain/core/value_objects.dart';
import 'package:task_manager/domain/core/value_validators.dart';

class ProjectName extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String>  value;
  factory ProjectName(String input){
    return ProjectName._(validateStringNotEmpty(input).andThen(validateMaxStringLegth(input, 30)));
  }
  const ProjectName._(this.value);
}
class TaskName extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String>  value;
  factory TaskName(String input){
    return TaskName._(validateStringNotEmpty(input).andThen(validateMaxStringLegth(input, 30)));
  }
  const TaskName._(this.value);
}
class TaskResponsibleUser extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String>  value;
  factory TaskResponsibleUser(String input){
    return TaskResponsibleUser._(validateStringNotEmpty(input));
  }
  const TaskResponsibleUser._(this.value);
}