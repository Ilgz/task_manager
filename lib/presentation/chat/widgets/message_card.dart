import 'package:flutter/material.dart';
import 'package:task_manager/domain/chat/message_chat.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/presentation/core/utils/name_color_generator.dart';

class MessageTile extends StatelessWidget {
  final MessageChat messageChat;
  const MessageTile({super.key, required this.messageChat});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: messageChat.sentByMe?MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
        messageChat.sentByMe?const Expanded(child: SizedBox()):const SizedBox(),
        Expanded(
          child: Container(
            width: 200,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: messageChat.sentByMe?Theme.of(context).primaryColor:Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30),
                topRight: const Radius.circular(30),
                bottomLeft: Radius.circular(messageChat.sentByMe?30:0),
                bottomRight: Radius.circular(messageChat.sentByMe?0:30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Visibility(
                  visible:!messageChat.sentByMe,
                  child: Text(
                    messageChat.sentFrom.userName.getOrCrash(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: NameColorGenerator.generateColorFromName(messageChat.sentFrom.userName.getOrCrash()),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  messageChat.messageContent.getOrCrash(),
                  style: Theme.of(context).textTheme.bodyText1
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                    DateFormat('kk:mm')
                        .format(DateTime.fromMillisecondsSinceEpoch(messageChat.date.millisecondsSinceEpoch)),
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize:12)
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        messageChat.sentByMe?const SizedBox():const Expanded(child: SizedBox())
      ],
    );
  }
  String formatDate(DateTime date) {
    var now = DateTime.now();
    var diff = now.difference(date);
    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inSeconds < 60) {
      return "Just now";
    } else if (diff.inMinutes > 0 && diff.inMinutes < 60) {
      return "${diff.inMinutes} minutes ago";
    } else if (diff.inHours >= 1 && diff.inHours < 24) {
      return "${diff.inHours} hours ago";
    } else if (diff.inDays >= 1 && diff.inDays < 7) {
      return "${diff.inDays} days ago";
    } else {
      return DateFormat("dd MMM").format(date);
    }
  }

}
