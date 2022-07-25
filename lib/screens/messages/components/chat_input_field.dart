import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ChatInputField extends StatefulWidget {
  ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  // late TextEditingController controller;
  final _controller = TextEditingController();
  int charLength = 0;
  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });
  }

  bool emojiShowing = false;
  bool isKeyboardVisible = false;
  _onEmojiSelected(Emoji emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding / 2,
            vertical: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xFF087949).withOpacity(0.08),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 0.30,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: new Container(
                          child: new IconButton(
                            icon: emojiShowing
                                ? Icon(Icons.keyboard)
                                : Icon(Icons.face),
                            onPressed: () {
                              setState(() {
                                emojiShowing = !emojiShowing;
                              });
                            },
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      SizedBox(width: kDefaultPadding / 4),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: _controller,
                          onChanged: _onChanged,
                          decoration: InputDecoration(
                            hintText: "Type message",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: new Container(
                          child: new IconButton(
                            icon: Icon(Icons.attach_file),
                            onPressed: () {
                              setState(() {
                                // emojiShowing = !emojiShowing;
                              });
                            },
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      (charLength > 0)
                          ? SizedBox()
                          : Material(
                              color: Colors.transparent,
                              child: new Container(
                                // margin: new EdgeInsets.symmetric(horizontal: 1.0),
                                child: new IconButton(
                                  icon: Icon(Icons.camera_alt_outlined),
                                  onPressed: () {
                                    setState(() {
                                      // emojiShowing = !emojiShowing;
                                    });
                                  },
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: kDefaultPadding / 2),
              // Container(
              //   padding: EdgeInsets.all(9),
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: kPrimaryColor,
              //   ),
              //   child: (charLength > 0)
              //       ? Icon(
              //           Icons.send,
              //           color: Colors.white,
              //         )
              //       : Icon(
              //           Icons.mic,
              //           color: Colors.white,
              //         ),
              // ),
              Material(
                color: Colors.transparent,
                child: new Container(
                  // padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                  // margin: new EdgeInsets.symmetric(horizontal: 1.0),
                  child: new IconButton(
                    icon: (charLength > 0)
                        ? Icon(
                            Icons.send,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.mic,
                            color: Colors.white,
                          ),
                    onPressed: () {
                      setState(() {
                        // emojiShowing = !emojiShowing;
                      });
                    },
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              // Offstage(
              //   offstage: emojiShowing,
              //   child: SizedBox(
              //     // height: 250,
              //     child: EmojiPicker(
              //       onEmojiSelected: (emoji, category) {
              //         print(emoji);
              //       },
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        // (emojiShowing ? buildSticker() : Container()),
        buildSticker()
      ],
    );
  }

  Widget buildSticker() {
    return Offstage(
      offstage: !emojiShowing,
      child: SizedBox(
        height: 250,
        child: EmojiPicker(
            onEmojiSelected: (Category category, Emoji emoji) {
              _onEmojiSelected(emoji);
            },
            onBackspacePressed: _onBackspacePressed,
            config: Config(
                columns: 7,
                // Issue: https://github.com/flutter/flutter/issues/28894
                emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                verticalSpacing: 0,
                horizontalSpacing: 0,
                initCategory: Category.RECENT,
                bgColor: const Color(0xFFF2F2F2),
                indicatorColor: Colors.blue,
                iconColor: Colors.grey,
                iconColorSelected: Colors.blue,
                progressIndicatorColor: Colors.blue,
                backspaceColor: Colors.blue,
                showRecentsTab: true,
                recentsLimit: 28,
                // noRecentsText: 'No Recents',
                // noRecentsStyle:
                //     const TextStyle(fontSize: 20, color: Colors.black26),
                tabIndicatorAnimDuration: kTabScrollDuration,
                categoryIcons: const CategoryIcons(),
                buttonMode: ButtonMode.MATERIAL)),
      ),
    );
  }
}
