import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CallUpcomingView extends StatelessWidget {
  CallUpcomingView({Key? key}) : super(key: key);

  final List<String> _image = [
    'assets/images/Aquaman_Amber_Heard.jpg',
    'assets/images/Aquaman_Amber_Heard.jpg',
    'assets/images/Aquaman_Amber_Heard.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(45)),
                child: Image.asset(
                  _image[Random().nextInt(_image.length)],
                  width: size.width,
                  height: size.height / 1.17,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 50,
                height: 7,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(45)),
              ),
              SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(.2)),
                            borderRadius: BorderRadius.circular(45)),
                      ),
                      Text(
                        'Design system',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Theme.of(context).accentColor),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor:
                            Theme.of(context).accentColor.withOpacity(.2),
                        child: Icon(
                          Icons.person,
                          color: Theme.of(context).accentColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 4,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                    radius: 2,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                    radius: 2,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                    radius: 1,
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(
                  height: kToolbarHeight,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.keyboard_arrow_left_outlined,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white30, width: 4),
                            borderRadius: BorderRadius.circular(45)),
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white30, width: 4),
                          borderRadius: BorderRadius.circular(45)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white30, width: 4),
                          borderRadius: BorderRadius.circular(45)),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: size.height / 1.3,
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: Container(
                    width: 250,
                    height: 60.0,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white10.withOpacity(.2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.video_call,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.mic_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.group,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Transform.rotate(
                              angle: pi / 2,
                              child: Icon(
                                Icons.call,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
