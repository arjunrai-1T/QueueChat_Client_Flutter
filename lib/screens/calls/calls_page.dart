import 'package:queuechat/models/Chat.dart';
import 'package:queuechat/screens/calls/call_view_page.dart';
import 'package:queuechat/screens/calls/single_call_page.dart';
import 'package:queuechat/screens/chats/chats_screen.dart';

import 'package:flutter/material.dart';
import 'package:multi_select_item/multi_select_item.dart';

import '../../constants.dart';

class CallTab extends StatefulWidget {
  const CallTab({Key? key}) : super(key: key);
  static final MultiSelectController controller1 = new MultiSelectController();

  @override
  _CallTabState createState() => _CallTabState();
}

bool isSelected(int i) {
  return MultiSelectController().selectedIndexes.contains(i);
}

class _CallTabState extends State<CallTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListView.builder(
            padding: EdgeInsets.all(0),
            primary: false,
            shrinkWrap: true,
            itemCount: chatsData.length,
            itemBuilder: (context, index) => MultiSelectItem(
              isSelecting: CallTab.controller1.isSelecting,
              onSelected: () {
                setState(() {
                  CallTab.controller1.toggle(index);
                });
              },
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CallUpcomingView(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: CallTab.controller1.isSelected(index)
                      ? new BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.2),
                        )
                      : new BoxDecoration(),
                  child: SingleCallWidget(
                      chat: chatsData[index],
                      press: () {
                        isSelected(index);

                        debugPrint(
                            '$CallTab.controller.selectedIndexes.length');
                      }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
