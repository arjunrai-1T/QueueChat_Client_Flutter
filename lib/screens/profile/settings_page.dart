import 'package:queuechat/screens/profile/components/chats_settings_page.dart';
import 'package:queuechat/screens/profile/components/help_page.dart';
import 'package:queuechat/screens/profile/components/profile_pic.dart';
import 'package:queuechat/screens/profile/components/storage_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

// import 'package:shop_app/enums.dart';

import 'components/account_page.dart';
import 'components/profileInfoEdit.dart';
import 'components/notification_page.dart';

class SettingsPage extends StatelessWidget {
  // static String routeName = "/profile";
  static const keyDarkMode = 'key-darkmode';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        // shrinkWrap: true,
        // padding: EdgeInsets.all(20),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SettingsScreen(children: [ProfileInfoEdit()]),
                ),
              );
            },
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: MediaQuery.of(context).size.width * 0.123,
                  backgroundImage: AssetImage("assets/images/user_2.png"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: MediaQuery.of(context).size.width * 0.64,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shuvam Mondal',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.049,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.006,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.50,
                            child: Text(
                              "it's always impossible until it's done",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          buildDarkMode(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          SettingsGroup(
            title: "GENERAL",
            children: [
              AccountPage(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              NotificationPage(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ChatsSettings(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              StoragePage(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              HelpPage(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              buildLogout(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          SettingsGroup(
            title: "FEEDBACK",
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              buildReportBug(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              buildSendFeedback(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDarkMode() => SwitchSettingsTile(
        title: 'Dark Mode',
        settingKey: keyDarkMode,
        leading: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF642ef3),
          ),
          child: Icon(
            Icons.toggle_on,
            color: Colors.white,
          ),
        ),
      );
  Widget buildLogout() => SimpleSettingsTile(
        title: 'Logout',
        subtitle: "",
        leading: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
        onTap: () => {},
      );

  Widget buildReportBug() => SimpleSettingsTile(
        title: 'Report A Bug',
        subtitle: "",
        leading: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: Icon(
            Icons.bug_report,
            color: Colors.white,
          ),
        ),
        onTap: () => {},
      );
  Widget buildSendFeedback() => SimpleSettingsTile(
        title: 'Send Feedback',
        subtitle: "",
        leading: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: Icon(
            Icons.feedback,
            color: Colors.white,
          ),
        ),
        onTap: () => {},
      );
}
