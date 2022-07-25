import 'package:queuechat/constants.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_item/multi_select_item.dart';

import 'components/body.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  MultiSelectController controller = new MultiSelectController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kristin Watson",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: (controller.isSelecting)
          ? <Widget>[
              IconButton(
                icon: Icon(Icons.push_pin_sharp),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.volume_up),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.archive),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more),
                onPressed: () {},
              ),
            ]
          : <Widget>[
              IconButton(
                icon: Icon(Icons.local_phone),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.videocam),
                onPressed: () {},
              ),
              SizedBox(width: kDefaultPadding / 2),
            ],
    );
  }
}
