import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager/domain/auth/i_auth_facade.dart';
import 'package:task_manager/domain/chat/i_chat_facade.dart';
import 'package:task_manager/domain/chat/message_chat.dart';
import 'package:task_manager/domain/core/errors.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/project_failure.dart';
import 'package:task_manager/infrastructure/chat/message_chat_dto.dart';
import 'package:task_manager/injection.dart';
@LazySingleton(as: IChatFacade)
class ChatFacade implements IChatFacade{
  final FirebaseFirestore _firebaseFirestore;
  ChatFacade(this._firebaseFirestore);
  @override
  Future<Either<FirebaseFirestoreFailure, Unit>> sendMessageForProject(Project project, MessageChat messageChat) async{
    try {
      final userOption = getIt<IAuthFacade>().getSignedInUserId();
      final userId =
          "users/${userOption.getOrElse(() => throw NotAuthenticatedError())}";
      await project.reference.update({
        "messages": FieldValue.arrayUnion([MessageChatDto.fromDomain(messageChat.copyWith(date:Timestamp.now(),sentFrom:messageChat.sentFrom.copyWith(reference:FirebaseFirestore.instance.doc(userId)))).toJson()])
      });
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFirestoreFailure.insufficientPermission());
      } else {
        return left(const FirebaseFirestoreFailure.unexpected());
      }
    }
  }




}