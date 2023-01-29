part of 'project_creator_bloc.dart';

@freezed
abstract class ProjectCreatorEvent with _$ProjectCreatorEvent{
  factory ProjectCreatorEvent.startProjectForm()=_StartProjectForm;
  factory ProjectCreatorEvent.cancelProjectForm()=_CancelProjectForm;
  factory ProjectCreatorEvent.startTaskForm()=_StartTaskForm;
  factory ProjectCreatorEvent.cancelTaskForm()=_CancelTaskForm;
}
