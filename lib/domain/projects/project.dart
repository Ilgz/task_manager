import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/domain/core/user.dart';
import 'package:task_manager/domain/projects/task.dart';
import 'package:task_manager/domain/projects/value_objects.dart';
part 'project.freezed.dart';
@freezed
abstract class Project with _$Project{
  factory Project(ProjectName taskName,bool isPublic,DocumentReference owner,List<User> members,List<Task> tasks)=_Project;
}