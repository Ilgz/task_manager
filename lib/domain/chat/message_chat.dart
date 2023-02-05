import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/domain/chat/value_objects.dart';
import 'package:task_manager/domain/users/user.dart';
import 'package:task_manager/infrastructure/core/firestore_helpers.dart';
part 'message_chat.freezed.dart';
@freezed
abstract class MessageChat implements _$MessageChat {
  MessageChat._();
  factory MessageChat({
    required MessageContent messageContent,
    required User sentFrom,
    required Timestamp date,
    required bool isLastMessageInColumn,
    required bool sentByMe,
  }  ) = _MessageChat;
  factory MessageChat.empty()=>MessageChat(messageContent: MessageContent(""), sentFrom:User.empty(), date: Timestamp.now(),isLastMessageInColumn: false,sentByMe: false);
}
