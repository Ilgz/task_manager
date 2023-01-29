import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:task_manager/domain/projects/i_project_repository.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/project_failure.dart';
import 'package:task_manager/domain/projects/task.dart';
part 'project_actor_bloc.freezed.dart';
part 'project_actor_event.dart';
part 'project_actor_state.dart';
@injectable
class ProjectActorBloc extends Bloc<ProjectActorEvent, ProjectActorState> {
  final IProjectRepository _projectRepository;
  ProjectActorBloc(this._projectRepository) : super(ProjectActorState.initial()) {
    on<ProjectActorEvent>((event, emit) async{
     await event.map(reInitializeTask:(e){},reInitializeProject:(e){
       emit(const ProjectActorState.reInitializeProjectState());
     },deleteProject: (e)async{
       Either<ProjectFailure, Unit>? failureOrSuccess;
         failureOrSuccess =   await  _projectRepository.deleteProject(e.project);
         emit(failureOrSuccess.fold((l) => ProjectActorState.deleteProjectFailure(l.map(unexpected: (_)=>"Unexpected Error", insufficientPermission: (_)=>"Insufficient permissions", unableToUpdate: (_)=>"Not found")), (r) => ProjectActorState.deleteProjectSuccess()));
     }, deleteTask: (e)async{
       await  _projectRepository.deleteTask(e.task, e.reference);
     });
    });
  }
}
