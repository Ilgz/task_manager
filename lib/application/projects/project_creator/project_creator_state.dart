part of 'project_creator_bloc.dart';

@freezed
abstract class ProjectCreatorState with _$ProjectCreatorState{
  factory ProjectCreatorState({required bool projectFormIsActive,required bool taskFormIsActive})=_ProjectCreatorState;
  factory ProjectCreatorState.initial()=>ProjectCreatorState(projectFormIsActive: false, taskFormIsActive: false);
}
