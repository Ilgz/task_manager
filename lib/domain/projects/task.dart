import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/domain/core/failures.dart';
import 'package:task_manager/domain/projects/value_objects.dart';

part 'task.freezed.dart' ;

@freezed
abstract class Task implements _$Task {
  Task._();
  factory Task(
      {required TaskName taskName,
      required bool isDone,
      required Timestamp date,
        @Default(false) bool isNew,
        required Option<DocumentReference> responsibleUser,
      required Option<bool> canBeModifiedAndIsAdmin}) = _Task;
  Option<ValueFailure<dynamic>> get failureOption {
    return taskName.value.fold((failure) => some(failure), (r) => none());
  }
  factory Task.empty(){
    return Task(taskName: TaskName(""), isDone: false, date: Timestamp.now(), responsibleUser: none(), canBeModifiedAndIsAdmin: some(true),isNew: true);
  }
}
