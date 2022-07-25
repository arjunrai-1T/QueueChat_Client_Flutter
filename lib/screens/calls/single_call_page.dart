import 'package:queuechat/models/Chat.dart';
import 'package:flutter/material.dart';

class SingleCallWidget extends StatelessWidget {
  const SingleCallWidget({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);
  final Chat chat;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(chat.image),
        ),
        Expanded(
          child: ListTile(
              title: Text(chat.name,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Row(children: [
                Icon(
                  chat.callStatus == 'Incoming'
                      ? (Icons.call_received_sharp)
                      : Icons.call_made_sharp,
                  size: 15,
                  color:
                      chat.callStatus == 'Incoming' ? Colors.teal : Colors.red,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      chat.chatMessage,
                      style: TextStyle(color: Theme.of(context).accentColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ]),
              trailing: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(
                        chat.callType == 'Audio' ? Icons.call : Icons.videocam,
                        color: Colors.teal),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
