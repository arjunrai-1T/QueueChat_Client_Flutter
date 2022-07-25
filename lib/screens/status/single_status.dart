import 'package:queuechat/models/Chat.dart';
import 'package:flutter/material.dart';

class SingleStatusItem extends StatelessWidget {
  const SingleStatusItem({
    Key? key,
    required this.chat,
  }) : super(key: key);
  final Chat chat;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              child: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(chat.image),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListTile(
            title: Text(chat.name),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                chat.time,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
