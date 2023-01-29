import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/task.dart';
import 'package:task_manager/domain/projects/value_objects.dart';

part 'project_dto.freezed.dart';

part 'project_dto.g.dart';

@freezed
abstract class ProjectDto implements _$ProjectDto {
  ProjectDto._();

  factory ProjectDto(
      {required String name,
      required bool isPublic,
      @ServerTimestampConverter()
          required Timestamp date,
      @DocumentReferenceConverter()
          required DocumentReference owner,
      @DocumentReferenceConverter()
      @JsonKey(ignore: true)
          DocumentReference? reference,
      @DocumentReferenceConverter()
          required List<DocumentReference> members,
      required List<TaskDto> tasks}) = _ProjectDto;

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  factory ProjectDto.fromDomain(Project project) => ProjectDto(
      name: project.projectName.getOrCrash(),
      isPublic: project.isPublic,
      date: project.date,
      owner: project.owner,
      members: project.members,
      tasks: project.tasks.map((task) => TaskDto.fromDomain(task)).toList());

  factory ProjectDto.fromFirestore(QueryDocumentSnapshot doc) {
    return ProjectDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(
      reference: doc.reference,
    );
  }

  Project toDomain() {
    return Project(
        projectName: ProjectName(name),
        isPublic: isPublic,
        owner: owner,
        reference: reference!,
        date: date,
        members: members,
        canBeModifiedAndIsAdmin: none(),
        tasks: tasks
            .map((task) => Task(
                taskName: TaskName(task.itemName),
                isDone: task.complete,
                date: task.date,
                responsibleUser: optionOf(task.owner),
                canBeModifiedAndIsAdmin: none()))
            .toList());
  }
}

class DocumentReferenceConverter
    implements JsonConverter<DocumentReference, DocumentReference> {
  const DocumentReferenceConverter();

  @override
  DocumentReference fromJson(DocumentReference documentReference) {
    return documentReference;
  }

  @override
  DocumentReference toJson(DocumentReference documentReference) =>
      documentReference;
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
abstract class TaskDto with _$TaskDto {
  factory TaskDto(
      String itemName,
      bool complete,
      @ServerTimestampConverter() Timestamp date,
      @DocumentReferenceConverter() DocumentReference? owner) = _TaskDto;

  factory TaskDto.fromDomain(Task task) => TaskDto(task.taskName.getOrCrash(),
      task.isDone, task.date, task.responsibleUser.toNullable());

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);
// factory NoteDto.fromFirestore(QueryDocumentSnapshot doc) {
//   return NoteDto.fromJson(doc.data()! as Map<String, dynamic>)
//       .copyWith(id: doc.id);
}
