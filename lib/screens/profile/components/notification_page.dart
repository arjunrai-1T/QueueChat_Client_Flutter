import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);
  static const keyConversionTone = 'key-ConversionTone';
  static const keyVibrate_message = 'key-Vibrate_message';
  static const keyVibrate_group = 'key-Vibrate_group';
  static const keyVibrate_calls = 'key-Vibrate_calls';
  static const keyLight_message = 'key-Light_message';
  static const keyLight_group = 'key-Light_group';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: "Notification",
      subtitle: "Message, group & call tones",
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
      ),
      child: SettingsScreen(
        title: 'Notification Settings',
        children: [
          buildConversionTone(),
          SettingsGroup(title: 'Messages', children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            buildNotificationToneMessage(),
            buildVibrateMessage(),
            buildLightMessage(),
            buildPriorityNotificationMessage(),
          ]),
          SettingsGroup(title: 'Groups', children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            buildNotificationToneGroup(),
            buildVibrateGroup(),
            buildLightGroup(),
            buildPriorityNotificationGroup(),
          ]),
          SettingsGroup(title: 'Calls', children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            buildNotificationToneCalls(),
            buildVibrateCalls(),
          ]),
        ],
      ),
    );
  }

  Widget buildNotificationToneMessage() => SimpleSettingsTile(
        title: "Notification Tone",
        subtitle: "Default (DimDimDow.ogg)",
      );
  Widget buildNotificationToneGroup() => SimpleSettingsTile(
        title: "Notification Tone",
        subtitle: "Default (DimDimDow.ogg)",
      );
  Widget buildNotificationToneCalls() => SimpleSettingsTile(
        title: "Ringtone",
        subtitle: "Default (DimDimDow.ogg)",
      );
  Widget buildConversionTone() => SwitchSettingsTile(
        title: "Conversion Tone",
        subtitle: "Play sounds for incoming and outgoing",
        settingKey: keyConversionTone,
      );
  Widget buildPriorityNotificationMessage() => SwitchSettingsTile(
        title: "High Priority Notification",
        subtitle: "Play sounds for incoming and outgoing",
        settingKey: keyConversionTone,
      );
  Widget buildPriorityNotificationGroup() => SwitchSettingsTile(
        title: "High Priority Notification",
        subtitle: "Play sounds for incoming and outgoing",
        settingKey: keyConversionTone,
      );

  Widget buildVibrateMessage() => RadioModalSettingsTile<int>(
        title: 'Vibrate',
        settingKey: keyVibrate_message,
        values: <int, String>{
          0: 'off',
          1: 'Default',
          2: 'Short',
          3: 'Long',
        },
        showTitles: true,
        enabled: true,
        selected: 1,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
  Widget buildVibrateGroup() => RadioModalSettingsTile<int>(
        title: 'Vibrate',
        settingKey: keyVibrate_group,
        values: <int, String>{
          0: 'off',
          1: 'Default',
          2: 'Short',
          3: 'Long',
        },
        showTitles: true,
        enabled: true,
        selected: 1,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
  Widget buildVibrateCalls() => RadioModalSettingsTile<int>(
        title: 'Vibrate',
        settingKey: keyVibrate_calls,
        values: <int, String>{
          0: 'off',
          1: 'Default',
          2: 'Short',
          3: 'Long',
        },
        showTitles: true,
        enabled: true,
        selected: 1,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
  Widget buildLightMessage() => RadioModalSettingsTile<int>(
        title: 'Light',
        settingKey: keyLight_message,
        values: <int, String>{
          0: 'None',
          1: 'White',
          2: 'Red',
          3: 'Yellow',
          4: 'Green',
          5: 'Cyan',
          6: 'Blue',
          7: 'Purple',
        },
        showTitles: true,
        enabled: true,
        selected: 1,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
  Widget buildLightGroup() => RadioModalSettingsTile<int>(
        title: 'Light',
        settingKey: keyLight_group,
        values: <int, String>{
          0: 'None',
          1: 'White',
          2: 'Red',
          3: 'Yellow',
          4: 'Green',
          5: 'Cyan',
          6: 'Blue',
          7: 'Purple',
        },
        showTitles: true,
        enabled: true,
        selected: 1,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
}
