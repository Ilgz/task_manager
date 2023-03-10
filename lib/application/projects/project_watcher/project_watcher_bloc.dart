
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager/domain/projects/i_project_repository.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/project_failure.dart';

part 'project_watcher_bloc.freezed.dart';

part 'project_watcher_event.dart';

part 'project_watcher_state.dart';

@injectable
class ProjectWatcherBloc
    extends Bloc<ProjectWatcherEvent, ProjectWatcherState> {
  final IProjectRepository iProjectRepository;
  ProjectWatcherBloc(this.iProjectRepository)
      : super(ProjectWatcherState.initial()) {
    on<ProjectWatcherEvent>((event, emit) {
      event.map(startWatchAll: (e) {
        emit(ProjectWatcherState.loadInProgress());
        iProjectRepository.watchAllProjects().listen((projects) {
          add(ProjectWatcherEvent.receiveProjects(projects));
        });

      },
          receiveProjects: (e) {
        emit(e.failureOrProjects.fold((f) => ProjectWatcherState.loadFailure(f),
            (notes) => ProjectWatcherState.loadSuccess(notes)));
      });
    });
  }
}
