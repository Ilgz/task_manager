import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/domain/core/user.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/task.dart';
import 'package:task_manager/domain/projects/value_objects.dart';
part 'project_dto.freezed.dart';
part 'project_dto.g.dart';
@freezed
abstract class ProjectDto with _$ProjectDto{
  factory ProjectDto({required String projectName,required bool isPublic, @ServerTimestampConverter() required Timestamp date,@JsonKey(ignore: true) DocumentReference? owner,required List<User> members,required List<TaskDto> tasks})=_ProjectDto;
  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);
  factory ProjectDto.fromFirestore(QueryDocumentSnapshot doc) {
    return ProjectDto.fromJson(doc.data()! as Map<String, dynamic>)
        .copyWith(owner: doc.reference);
  }
  // Project toDomain() {
  //   return Project(ProjectName(projectName),isPublic,owner!,members,tasks.map((task) => Task(TaskName(task.name), task.isDone, TaskResponsibleUser(task.responsibleUser))).toList());
  // }g
}
class ServerTimestampConverter implements JsonConverter<Timestamp, Timestamp> {
  const ServerTimestampConverter();
  @override
  Timestamp fromJson(Timestamp timestamp) {
    return timestamp;
  }
  @override
  Timestamp toJson(Timestamp date) => date;
}
@freezed
abstract class TaskDto with _$TaskDto{
  factory TaskDto(String name,bool isDone,@ServerTimestampConverter() Timestamp date,String responsibleUser)=_TaskDto;
  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);
  // factory NoteDto.fromFirestore(QueryDocumentSnapshot doc) {
  //   return NoteDto.fromJson(doc.data()! as Map<String, dynamic>)
  //       .copyWith(id: doc.id);
}