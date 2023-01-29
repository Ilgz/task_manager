part of 'project_actor_bloc.dart';

@freezed
abstract class ProjectActorState with _$ProjectActorState{
 const factory ProjectActorState.reInitializeProjectState()=_ReInitializeProjectState;
 const factory ProjectActorState.reInitializeTaskState()=_ReInitializeTaskState;
 const factory ProjectActorState.deleteProjectSuccess()=_DeleteProjectSuccess;
 const factory ProjectActorState.deleteProjectFailure(String failureException)=_DeleteProjectFailure;
 const factory ProjectActorState.deleteTaskSuccess()=_DeleteTaskSuccess;
 const factory ProjectActorState.deleteTaskFailure(String failureException)=_DeleteTaskFailure;
 factory ProjectActorState.initial()=_Initial;
}
