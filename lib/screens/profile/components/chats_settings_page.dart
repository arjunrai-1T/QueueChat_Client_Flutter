import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class ChatsSettings extends StatelessWidget {
  const ChatsSettings({Key? key}) : super(key: key);
  static const keyEnterSend = 'key-EnterSend';
  static const keyMediaVisibility = 'key-MediaVisibility';
  static const keyChatArchived = 'key-ChatArchived';
  static const keyFontSize = 'key-FontSize';
  static const keyLanguage = 'key-Language';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: "Chats",
      subtitle: "Chats settings,Chat history",
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      child: SettingsScreen(
        title: 'Chats',
        children: [
          SettingsGroup(
            title: 'Chat setting',
            children: [
              buildEnterSend(),
              buildMediaVisibility(),
              buildFontSize()
            ],
          ),
          SettingsGroup(
            title: 'Archived chats',
            children: [buildChatArchived()],
          ),
          buildChatbackup(),
          buildChatHistory()
        ],
      ),
    );
  }

  Widget buildEnterSend() => SwitchSettingsTile(
        title: "Enter is Send",
        subtitle: "Play sounds for incoming and outgoing",
        settingKey: keyEnterSend,
      );
  Widget buildMediaVisibility() => SwitchSettingsTile(
        title: "Media Visibility",
        subtitle: "Play sounds for incoming and outgoing",
        settingKey: keyMediaVisibility,
      );
  Widget buildChatArchived() => SwitchSettingsTile(
        title: "Keep Chat Archived",
        subtitle: "Play sounds for incoming and outgoing",
        settingKey: keyChatArchived,
      );
  Widget buildFontSize() => RadioModalSettingsTile<int>(
        title: 'Font Size',
        settingKey: keyFontSize,
        values: <int, String>{
          0: 'Short',
          1: 'Medium',
          2: 'Long',
        },
        showTitles: true,
        enabled: true,
        selected: 1,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
  Widget buildAppLanguage() => RadioModalSettingsTile<int>(
        title: 'App Language',
        settingKey: keyFontSize,
        values: <int, String>{
          0: "Phone's language (English)",
          1: 'Hindi',
          2: 'English',
        },
        showTitles: true,
        enabled: true,
        selected: 1,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
  Widget buildChatbackup() => SimpleSettingsTile(
        title: "Chat backup",
        subtitle: "",
        leading: Icon(Icons.backup),
      );
  Widget buildChatHistory() => SimpleSettingsTile(
        title: "Chat History",
        subtitle: "",
        leading: Icon(Icons.history),
      );
}
