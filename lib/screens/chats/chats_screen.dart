import 'dart:async';

import 'package:queuechat/components/filled_outline_button.dart';
import 'package:queuechat/models/Chat.dart';
import 'package:queuechat/screens/calls/calls_page.dart';
import 'package:queuechat/screens/messages/message_screen.dart';
import 'package:queuechat/screens/profile/settings_page.dart';
import 'package:queuechat/screens/status/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi_select_item/multi_select_item.dart';

import '../../constants.dart';
import 'components/body.dart';
import 'components/chat_card.dart';

class ChatsScreen extends StatefulWidget {
  ChatsScreen({Key? key}) : super(key: key);
  @override
  ChatsScreenState createState() => ChatsScreenState();
}

class ChatsScreenState extends State<ChatsScreen> {
  int selectPage = 0;
  GlobalKey _stickyKey = GlobalKey();
  static final MultiSelectController controller = new MultiSelectController();
  ScrollController _scrollController =
      new ScrollController(); // set controller on scrolling
  bool _show = true;

  @override
  void initState() {
    super.initState();
    // addItemsToTheList();
    handleScroll();
    selectPage = 0;
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  void showFloationButton() {
    new Timer(const Duration(milliseconds: 150), () {
      setState(() {
        _show = true;
      });
    });
  }

  void hideFloationButton() {
    new Timer(const Duration(milliseconds: 00), () {
      setState(() {
        _show = false;
      });
    });
  }

  void handleScroll() async {
    // final RenderBox renderBox =stickyKey.currentContext!.findRenderObject() as RenderBox;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 30) {
        hideFloationButton();
      }
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward ||
          selectPage == 0) {
        showFloationButton();
      }
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   selectPage = 0;
  // }

  bool isSelected(int i) {
    return MultiSelectController().selectedIndexes.contains(i);
  }

  void selectAll() {
    setState(() {
      controller.toggleAll();
      CallTab.controller1.toggleAll();
    });
  }

  Widget _currentPage(int selectPage) {
    //int selectPage = widget.page;
    switch (selectPage) {
      case 0:
        //currentTitle = '';
        return buildChatsProfiles();
      // case 1 :
      //   currentTitle = 'chat';
      //   return prefix0.Conversation();
      case 1:
        //currentTitle = '';
        return StatusTab();
      case 2:
        //currentTitle = '';
        return CallTab();
      default:
        // currentTitle = '';
        return SettingsPage();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            key: _stickyKey,
            floating: true,
            pinned: true,
            primary: true,
            // snap: true,
            backgroundColor: kPrimaryColor,
            expandedHeight:
                (controller.selectedIndexes.length > 0 || selectPage > 0)
                    ? 60
                    : 120,
            automaticallyImplyLeading: false,
            flexibleSpace:
                (controller.selectedIndexes.length > 0 || selectPage > 0)
                    ? null
                    : FlexibleSpaceBar(
                        // centerTitle: true,
                        // collapseMode: CollapseMode.pin,
                        titlePadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        title: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Row(
                              children: [
                                FillOutlineButton(
                                  press: () {},
                                  text: "Recent ",
                                ),
                                SizedBox(width: 10),
                                FillOutlineButton(
                                  press: () {},
                                  text: "Active",
                                  isFilled: false,
                                ),

                                // SizedBox(width: 20),
                                // SizedBox(width: 20),
                              ],
                            ),
                          ],
                        ),
                      ),
            //  Container(
            //   padding: EdgeInsets.fromLTRB(
            //       kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
            //   color: kPrimaryColor,
            //   child: Row(
            //     children: [
            //       FillOutlineButton(press: () {}, text: "Recent Message"),
            //       SizedBox(width: kDefaultPadding),
            //       FillOutlineButton(
            //         press: () {},
            //         text: "Active",
            //         isFilled: false,
            //       ),
            //     ],
            //   ),
            // ),
            title: (controller.selectedIndexes.length > 0 ||
                    CallTab.controller1.selectedIndexes.length > 0)
                ? Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          selectAll();
                        },
                      ),
                      (selectPage == 2)
                          ? Text(
                              ' ${CallTab.controller1.selectedIndexes.length}')
                          : Text(' ${controller.selectedIndexes.length}'),
                    ],
                  )
                : Container(
                    child: (!_show) ? SizedBox() : Text("Chats"),
                  ),
            actions: (controller.selectedIndexes.length > 0 ||
                    CallTab.controller1.selectedIndexes.length > 0)
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
          ),
          SliverToBoxAdapter(
            child: IndexedStack(
              //index: this._bottomNavIndex,
              children: [
                _currentPage(selectPage),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectPage,
      onTap: (value) {
        setState(() {
          selectPage = value;
          if (selectPage == 0) {
            controller.isSelecting = true;
            // controller.toggleAll();
          } else if (selectPage == 2) {
            CallTab.controller1.isSelecting = true;
            // CallTab.controller1.toggleAll();
          } else if (selectPage == 1) {
            controller.isSelecting = false;
            controller.toggleAll();
            CallTab.controller1.toggleAll();
          } else if (selectPage == 3) {
            controller.isSelecting = false;
            controller.toggleAll();
            CallTab.controller1.toggleAll();
          } else {
            controller.isSelecting = false;
            controller.toggleAll();
            CallTab.controller1.toggleAll();
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.messenger),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: "Status",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: "Calls",
        ),
        BottomNavigationBarItem(
            icon: CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage("assets/images/user_2.png")),
            label: "Profile")
      ],
    );
  }

  Widget buildChatsProfiles() => ListView.builder(
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
                // press: () {
                //   if (controller.isSelecting) {
                //     MultiSelectController().select(index);
                //   } else if (controller.selectedIndexes.length == 0) {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => MessagesScreen(),
                //       ),
                //     );
                //   }
                // },
                press: () {
                  (controller.isSelecting &&
                          controller.selectedIndexes.length > 0)
                      ? isSelected(index)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MessagesScreen(),
                          ),
                        );
                  debugPrint('$controller.selectedIndexes.length');
                }),
          ),
        ),
      );
}
