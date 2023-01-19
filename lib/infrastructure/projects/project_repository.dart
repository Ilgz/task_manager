
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager/domain/auth/i_auth_facade.dart';
import 'package:task_manager/domain/core/errors.dart';
import 'package:task_manager/domain/core/failures.dart';
import 'package:task_manager/domain/projects/i_project_repository.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/project_failure.dart';
import 'package:task_manager/injection.dart';
@LazySingleton(as: IProjectRepository)
class ProjectRepository implements IProjectRepository{
  FirebaseFirestore firebaseFirestore;
  ProjectRepository(this.firebaseFirestore);
  @override
  Stream<Either<ProjectFailure, List<Project>>> watchAllProjects() async* {
    final userOption=getIt<IAuthFacade>().getSignedInUser();
    final userId=userOption.getOrElse(() => throw NotAuthenticatedError());
    // yield* firebaseFirestore.collection("tasks").where("members",
    //     arrayContains: "users/$userId").snapshots().map((projects) => right<ProjectFailure, List<Project>>(projects.docs.map((project) => )));
  }





}