import 'package:dartz/dartz.dart';
import 'package:task_manager/domain/chat/message_chat.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/project_failure.dart';

abstract class IChatFacade{
  Future<Either<FirebaseFirestoreFailure, Unit>> sendMessageForProject(Project project,MessageChat messageChat);

}