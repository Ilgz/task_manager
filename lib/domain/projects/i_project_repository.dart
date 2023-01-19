import 'package:dartz/dartz.dart';
import 'package:task_manager/domain/core/failures.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/project_failure.dart';
abstract class IProjectRepository{
  Stream<Either<ProjectFailure,List<Project>>> watchAllProjects();
}