import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/domain/projects/value_objects.dart';
part 'task.freezed.dart';
@freezed
abstract class Task with _$Task{
  factory Task(TaskName taskName,bool isDone,TaskResponsibleUser responsibleUser)=_Task;
}