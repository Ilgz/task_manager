import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:task_manager/domain/auth/i_auth_facade.dart';
import 'package:task_manager/domain/core/errors.dart';
import 'package:task_manager/domain/projects/i_project_repository.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/project_failure.dart';
import 'package:task_manager/domain/projects/task.dart';
import 'package:task_manager/infrastructure/core/firestore_helpers.dart';
import 'package:task_manager/infrastructure/projects/project_dto.dart';
import 'package:task_manager/injection.dart';

@LazySingleton(as: IProjectRepository)
class ProjectRepository implements IProjectRepository {
  FirebaseFirestore _firebaseFirestore;

  ProjectRepository(this._firebaseFirestore);

  @override
  Stream<Either<ProjectFailure, List<Project>>> watchAllProjects() async* {
    final userOption = getIt<IAuthFacade>().getSignedInUser();
    final userId = userOption.getOrElse(() => throw NotAuthenticatedError());
    yield* _firebaseFirestore
        .collection("tasks")
        .where("members",
            arrayContains: _firebaseFirestore.doc("users/$userId"))
        .snapshots()
        .map((projects) => right<ProjectFailure, List<Project>>(projects.docs
            .map((project) => ProjectDto.fromFirestore(project).toDomain())
            .map((project) => getRightsProject(project, userId))
            .map((project) => project.copyWith(
                tasks: project.tasks
                    .map((task) => getRightsTask(task, userId, project.owner))
                    .toList()))
            .toList()));
  }

  Task getRightsTask(Task task, String userId, DocumentReference owner) {
    return task.copyWith(canBeModifiedAndIsAdmin: some(true));
    //return task.copyWith(canBeModifiedAndIsAdmin: owner.path==userId?some(true):task.responsibleUser.fold(() => none(), (docRef) => some(docRef.path==userId)));
  }

  Project getRightsProject(Project project, String userId) {
    return project.copyWith(
        canBeModifiedAndIsAdmin: (project.members
                .map((member) => member.path.contains(userId))
                .isNotEmpty)
            ? (project.owner.path.contains(userId) ? some(true) : some(false))
            : none());
  }

  @override
  Future<Either<ProjectFailure, Unit>> createProject(Project project) async {
    try {
      final userOption = getIt<IAuthFacade>().getSignedInUser();
      final userId = userOption.getOrElse(() => throw NotAuthenticatedError());
      project =
          project.copyWith(owner: _firebaseFirestore.doc("users/$userId"));
      project =
          project.copyWith(members: [_firebaseFirestore.doc("users/$userId")]);
      await _firebaseFirestore.projectCollection.add(
          ProjectDto.fromDomain(project).copyWith(reference: null).toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const ProjectFailure.insufficientPermission());
      } else {
        return left(const ProjectFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ProjectFailure, Unit>> deleteProject(Project project) async{
    try {
      await project.reference.delete();
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const ProjectFailure.insufficientPermission());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const ProjectFailure.unableToUpdate());
      } else {
        return left(const ProjectFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ProjectFailure, Unit>> updateProject(Project project) async {
    try {
      await project.reference.update({
        'name': project.projectName.getOrCrash(), // John Doe
      });
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const ProjectFailure.insufficientPermission());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const ProjectFailure.unableToUpdate());
      } else {
        return left(const ProjectFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ProjectFailure, Unit>> createTask(
      Task task, DocumentReference reference) async {
    try {
      await reference.update({
        "tasks": FieldValue.arrayUnion([TaskDto.fromDomain(task).toJson()])
      });
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const ProjectFailure.insufficientPermission());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const ProjectFailure.unableToUpdate());
      } else {
        return left(const ProjectFailure.unexpected());
      }
    }
  }
  @override
  Future<Either<ProjectFailure, Unit>> deleteTask(Task task, DocumentReference<Object?> reference) async{
    try {
      await reference.update({
        "tasks": FieldValue.arrayRemove([TaskDto.fromDomain(task).toJson()])
      });
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const ProjectFailure.insufficientPermission());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const ProjectFailure.unableToUpdate());
      } else {
        return left(const ProjectFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ProjectFailure, Unit>> updateTask(Task task, DocumentReference<Object?> reference,Task initialTask)async {
    try {
      await reference.update({
        "tasks": FieldValue.arrayRemove([TaskDto.fromDomain(initialTask).toJson()])
      });
      await reference.update({
        "tasks": FieldValue.arrayUnion([TaskDto.fromDomain(task).toJson()])
      });
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const ProjectFailure.insufficientPermission());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const ProjectFailure.unableToUpdate());
      } else {
        return left(const ProjectFailure.unexpected());
      }
    }
  }


}
