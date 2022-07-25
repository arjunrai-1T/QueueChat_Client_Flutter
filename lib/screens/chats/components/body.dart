import 'package:queuechat/components/filled_outline_button.dart';
import 'package:queuechat/constants.dart';
import 'package:queuechat/models/Chat.dart';
import 'package:queuechat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_item/multi_select_item.dart';

import 'chat_card.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  static final MultiSelectController controller = new MultiSelectController();
  void selectAll() {
    setState(() {
      controller.toggleAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // buildAppBar(),

        ListView.builder(
      padding: EdgeInsets.all(0),
      primary: false,
      shrinkWrap: true,
      itemCount: chatsData.length,
      itemBuilder: (context, index) => MultiSelectItem(
        isSelecting: controller.isSelecting,
        onSelected: () {
          setState(() {
            controller.toggle(index);
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: controller.isSelected(index)
              ? new BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.2),
                )
              : new BoxDecoration(),
          child: ChatCard(
            chat: chatsData[index],
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MessagesScreen(),
              ),
            ),
          ),
        ),
      ),
    );

    // SliverToBoxAdapter(
    //   child: Column(
    //     children: [
    //       Container(
    //         padding: EdgeInsets.fromLTRB(
    //             kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
    //         color: kPrimaryColor,
    //         child: Row(
    //           children: [
    //             FillOutlineButton(press: () {}, text: "Recent Message"),
    //             SizedBox(width: kDefaultPadding),
    //             FillOutlineButton(
    //               press: () {},
    //               text: "Active",
    //               isFilled: false,
    //             ),
    //           ],
    //         ),
    //       ),
    //       Expanded(
    //         child: ListView.builder(
    //           itemCount: chatsData.length,
    //           itemBuilder: (context, index) => MultiSelectItem(
    //             isSelecting: controller.isSelecting,
    //             onSelected: () {
    //               setState(() {
    //                 controller.toggle(index);
    //               });
    //             },
    //             child: Container(
    //               width: MediaQuery.of(context).size.width,
    //               decoration: controller.isSelected(index)
    //                   ? new BoxDecoration(
    //                       color: kPrimaryColor.withOpacity(0.2),
    //                     )
    //                   : new BoxDecoration(),
    //               child: ChatCard(
    //                 chat: chatsData[index],
    //                 press: () => Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (context) => MessagesScreen(),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),

    floatingActionButton:
    FloatingActionButton(
      onPressed: () {},
      backgroundColor: kPrimaryColor,
      child: Icon(
        Icons.person_add_alt_1,
        color: Colors.white,
      ),
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
                  },
                ),
                Text(' ${controller.selectedIndexes.length}'),
              ],
            )
          : Text("Chats"),
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
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more),
                onPressed: () {},
              ),
            ],
    );
  }
}
