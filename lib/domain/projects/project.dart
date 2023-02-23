import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/domain/chat/message_chat.dart';
import 'package:task_manager/domain/core/failures.dart';
import 'package:task_manager/domain/projects/task.dart';
import 'package:task_manager/domain/projects/value_objects.dart';
import 'package:task_manager/domain/users/user.dart';
import 'package:task_manager/infrastructure/core/firestore_helpers.dart';

part 'project.freezed.dart';

@freezed
abstract class Project implements _$Project {
  Project._();

  factory Project({
    required ProjectName projectName,
    required bool isPublic,
    required User owner,
    required DocumentReference reference,
    required Timestamp date,
    required List<User> members,
    required Option<bool> canBeModifiedAndIsAdmin,
    required List<Task> tasks,
    required List<MessageChat> messages,
    @Default(false) bool isNew
  }  ) = _Project;
  factory Project.empty({
    FirebaseFirestore? firebaseFirestore
  }) {
    final dummyRef=(firebaseFirestore??FakeFirebaseFirestore()).dummyRef;
    return Project(projectName:ProjectName(""),messages:[],isPublic:true,owner:User.empty(),reference:dummyRef,date: Timestamp.now(),members: [],canBeModifiedAndIsAdmin: some(true),tasks: [],isNew: true);}
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
