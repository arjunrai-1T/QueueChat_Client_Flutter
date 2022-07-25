import 'package:queuechat/screens/profile/components/accountScreen/change_number.dart';
import 'package:flutter/material.dart';

import 'accountScreen/change_number_view.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class ProfileInfoEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          Column(
            children: [
              ListTile(
                onTap: () {
                  _bottomSheet(context);
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                // dense: true,
                title: Text(
                  'Name',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).accentColor.withOpacity(0.6)),
                ),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.edit),
                subtitle: Text(
                  'Shuvam',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                // horizontalTitleGap: 10,
                // enableFeedback: true,
              ),
              ListTile(
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  dense: true,
                  title: Text(
                      'data dsa;dlsalkasdm sdnlskmdlasmd lnd askmdlsad lsdnsksadls dl dl dl dlas '),
                  leading: Text(''),
                  subtitle: Text(''),
                  trailing: Text('')),
            ],
          ),
          Divider(),
          Column(
            children: [
              ListTile(
                onTap: () {
                  _bottomSheet(context);
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                // dense: true,
                title: Text(
                  'Name',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).accentColor.withOpacity(0.6)),
                ),
                leading: Icon(Icons.error_outline_outlined),
                trailing: Icon(Icons.edit),
                subtitle: Text(
                  'Shuvam',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                // horizontalTitleGap: 10,
                // enableFeedback: true,
              ),
              ListTile(
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  dense: true,
                  title: Text(
                      'data dsa;dlsalkasdm sdnlskmdlasmd lnd askmdlsad lsdnsksadls dl dl dl dlas '),
                  leading: Text(''),
                  subtitle: Text(''),
                  trailing: Text('')),
            ],
          ),
          Divider(),
          Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNumberView(),
                    ),
                  );
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                // dense: true,
                title: Text(
                  'Phone',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).accentColor.withOpacity(0.6)),
                ),
                leading: Icon(Icons.phone),
                subtitle: Text(
                  '+91 8013507665',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                // horizontalTitleGap: 10,
                // enableFeedback: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _bottomSheet(context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 210.0,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text(
                      'When using mobile data',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.emoji_emotions),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'cancel'.toUpperCase(),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'ok'.toUpperCase(),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
