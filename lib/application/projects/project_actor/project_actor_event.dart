part of 'project_actor_bloc.dart';
@freezed
abstract class ProjectActorEvent with _$ProjectActorEvent{
  const factory ProjectActorEvent.deleteProject(Project project)=_Deleted;
  const factory ProjectActorEvent.deleteTask(Task task,DocumentReference reference)=_DeleteTask;
  const factory ProjectActorEvent.reInitializeProject()=_ReInitializeProject;
  const factory ProjectActorEvent.reInitializeTask()=_ReInitializeTask;
}

