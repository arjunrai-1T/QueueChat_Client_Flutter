import 'package:queuechat/constants.dart';
import 'package:queuechat/models/ChatMessage.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_item/multi_select_item.dart';

import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  MultiSelectController controller = new MultiSelectController();
  void selectAll() {
    setState(() {
      controller.toggleAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: demeChatMessages.length,
                itemBuilder: (context, index) => MultiSelectItem(
                  isSelecting: controller.isSelecting,
                  onSelected: () {
                    setState(() {
                      controller.toggle(index);
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    width: MediaQuery.of(context).size.width,
                    decoration: controller.isSelected(index)
                        ? new BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.2),
                          )
                        : new BoxDecoration(),
                    child: Message(message: demeChatMessages[index]),
                  ),
                ),
              ),
            ),
          ),
          ChatInputField(),
        ],
      ),
      // bottomNavigationBar: ChatInputField(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: (controller.isSelecting)
          ? Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    selectAll();
                    BackButton();
                  },
                ),
                Text(' ${controller.selectedIndexes.length}'),
              ],
            )
          : Row(
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
                icon: Icon(Icons.star),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.send),
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
              IconButton(
                icon: Icon(Icons.more),
                onPressed: () {},
              ),
            ],
    );
  }

  AppBar buildAppBar1() {
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
