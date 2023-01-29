import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
part 'project_creator_bloc.freezed.dart';
part 'project_creator_event.dart';
part 'project_creator_state.dart';

class ProjectCreatorBloc extends Bloc<ProjectCreatorEvent, ProjectCreatorState> {
  ProjectCreatorBloc() : super(ProjectCreatorState.initial()) {
    on<ProjectCreatorEvent>((event, emit) {
      event.map(
          startProjectForm: (e) {
            emit(state.copyWith(projectFormIsActive: true));
          },
          cancelProjectForm: (e) {
            emit(state.copyWith(projectFormIsActive: false));
          },
          startTaskForm: (e) {
            emit(state.copyWith(taskFormIsActive: true));
          },
          cancelTaskForm: (e) {
            emit(state.copyWith(taskFormIsActive: false));
          });
    });
  }
}
