import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:task_manager/domain/core/failures.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/project_failure.dart';
import 'package:task_manager/domain/projects/task.dart';
abstract class IProjectRepository{
  Stream<Either<ProjectFailure,List<Project>>> watchAllProjects();
  Future<Either<ProjectFailure, Unit>>updateProject(Project project);
  Future<Either<ProjectFailure, Unit>>createProject(Project project);
  Future<Either<ProjectFailure, Unit>>deleteProject(Project project);
  Future<Either<ProjectFailure, Unit>>updateTask(Task task,DocumentReference documentReference,Task initialTask);
  Future<Either<ProjectFailure, Unit>>createTask(Task task,DocumentReference documentReference);
  Future<Either<ProjectFailure, Unit>>deleteTask(Task task,DocumentReference documentReference);
}