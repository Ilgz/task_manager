import 'package:dartz/dartz.dart';
import 'package:task_manager/domain/core/failures.dart';
import 'package:task_manager/domain/core/value_objects.dart';
import 'package:task_manager/domain/core/value_validators.dart';

class MessageContent extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String>  value;
  factory MessageContent(String input){
    return MessageContent._(validateStringNotEmpty(input));
  }
  const MessageContent._(this.value);
}

