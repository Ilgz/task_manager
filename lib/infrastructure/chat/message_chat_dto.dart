import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/domain/chat/message_chat.dart';
import 'package:task_manager/domain/chat/value_objects.dart';
import 'package:task_manager/domain/users/user.dart';
import 'package:task_manager/infrastructure/core/firestore_helpers.dart';
part 'message_chat_dto.freezed.dart';
part 'message_chat_dto.g.dart';
@freezed
abstract class MessageChatDto implements  _$MessageChatDto {
  MessageChatDto._();
  factory MessageChatDto(
      {required String content,
      @ServerTimestampConverter()
          required Timestamp date,
      @DocumentReferenceConverter()
          required DocumentReference sentFrom,
      }) = _MessageChatDto;
  factory MessageChatDto.fromJson(Map<String, dynamic> json) =>
      _$MessageChatDtoFromJson(json);
  factory MessageChatDto.fromDomain(MessageChat messageChat) => MessageChatDto(
      content: messageChat.messageContent.getOrCrash(),date: messageChat.date,sentFrom:messageChat.sentFrom.reference);
  factory MessageChatDto.fromFirestore(DocumentSnapshot doc) {
    return MessageChatDto.fromJson(doc.data()! as Map<String, dynamic>);
  }
  MessageChat toDomain() {
    return MessageChat(messageContent: MessageContent(content), sentFrom:User.empty().copyWith(reference:sentFrom), date: date,isLastMessageInColumn: false,sentByMe: false);
  }
}



