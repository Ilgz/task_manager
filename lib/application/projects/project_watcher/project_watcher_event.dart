part of 'project_watcher_bloc.dart';


@freezed
class ProjectWatcherEvent with _$ProjectWatcherEvent{
  const factory ProjectWatcherEvent.startWatchAll()=_StartWatchAll;
  const factory ProjectWatcherEvent.receiveNotes(Either<ProjectFailure,List<Project>> failureOrProjects)=_ReceiveNotes;
}
