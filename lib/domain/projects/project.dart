import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/domain/core/failures.dart';
import 'package:task_manager/domain/projects/task.dart';
import 'package:task_manager/domain/projects/value_objects.dart';

part 'project.freezed.dart';

@freezed
abstract class Project implements _$Project {
  Project._();

  factory Project({
    required ProjectName projectName,
    required bool isPublic,
    required DocumentReference owner,
    required DocumentReference reference,
    required Timestamp date,
    required List<DocumentReference> members,
    required Option<bool> canBeModifiedAndIsAdmin,
    required List<Task> tasks,
    @Default(false) bool isNew
  }  ) = _Project;
  factory Project.empty() {
    final dummyRef=FirebaseFirestore.instance.doc("/");
    return Project(projectName:ProjectName(""),isPublic:true,owner:dummyRef,reference:dummyRef,date: Timestamp.now(),members: [],canBeModifiedAndIsAdmin: some(true),tasks: [],isNew: true);}
  Option<ValueFailure<dynamic>> get failureOption {
    return projectName.failureOrUnit
        .andThen(tasks
                .map((task) => task.taskName.failureOrUnit)
                .where((element) => element.isLeft())
                .isNotEmpty
            ? left(ValueFailure.empty(failedValue: ""))
            : right(unit))
        .fold((l) => some(ValueFailure.empty(failedValue: "")), (r) => none());
  }
}
