import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../constants.dart';

class StatusViewPage extends StatelessWidget {
  StatusViewPage({Key? key}) : super(key: key);

  final List<String> _image = [
    'assets/images/Aquaman_Amber_Heard.jpg',
    'assets/images/Aquaman_Amber_Heard.jpg',
    'assets/images/Aquaman_Amber_Heard.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  // borderRadius:
                  //     BorderRadius.vertical(bottom: Radius.circular(45)),
                  child: Image.asset(
                    _image[Random().nextInt(_image.length)],
                    width: size.width,
                    height: size.height * 0.9125,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 5, 24, 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: size.width / 4,
                        height: 4,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(45)),
                      ),
                      Container(
                        width: size.width / 4,
                        height: 4,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(45)),
                      ),
                      Container(
                        width: size.width / 4,
                        height: 4,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(45)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
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
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.more),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Positioned(
              // top: size.height / 1.3,
              left: 0,
              right: 0,
              bottom: 10,
              child: Center(
                  child: Column(
                children: [
                  Container(
                    transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                    child: Text(
                      'Replay',
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 20),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      size: 35,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_up)
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
