import 'package:queuechat/models/Chat.dart';
import 'package:queuechat/screens/status/single_status.dart';
import 'package:queuechat/screens/status/status_view_page.dart';
import 'package:flutter/material.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Color(0xff128C7E),
                      foregroundColor: Color(0xff128C7E),
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/user_2.png'),
                    ),
                    Positioned(
                      top: 40,
                      left: 40,
                      child: CircleAvatar(
                        radius: 10,
                        child: Icon(Icons.add, size: 20),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListTile(
                    title: Text('My Status'),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Text('Tap to add status update',
                          style:
                              TextStyle(color: Theme.of(context).accentColor)),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text('Viewed updates',
                  style: TextStyle(fontWeight: FontWeight.w400)),
            ),

            ListView.builder(
              padding: EdgeInsets.all(0),
              primary: false,
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatusViewPage(),
                    ),
                  );
                },
                child: SingleStatusItem(
                  chat: chatsData[index],
                ),
              ),
            ),

            // Since the ExpansionTile has top and bottom borders by default and we don't want that so we
            //use Theme to override its dividerColor property
            ExpansionTile(
              tilePadding: EdgeInsets.all(0.0),
              title: Text(
                'Muted updates',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              initiallyExpanded: false,
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StatusViewPage(),
                        ),
                      );
                    },
                    child: SingleStatusItem(
                      chat: chatsData[index],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
