import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';

  static const keyRadio = 'key-radio-sync-period';
  static const keyLastSeen = 'key-LastSeen';
  static const keyProfilePhoto = 'key-ProfilePhoto';
  static const keyAbout = 'key-About';
  static const keyStatus = 'key-Status';
  static const keyReadReceipts = 'key-ReadReceipts';
  static const keyGroup = 'key-Group';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Privacy',
      subtitle: "",
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(
          Icons.privacy_tip,
          color: Colors.white,
        ),
      ),
      onTap: () => {},
      child: SettingsScreen(
        title: 'Privacy',
        children: [
          SettingsGroup(
            title: "",
            children: [
              buildPersonalInfo(),
              buildLastSeen(),
              buildProfilePhoto(),
              buildAbout(),
              buildStatus(),
              buildReadReceipts()
            ],
          ),
          SettingsGroup(
            title: "",
            children: [
              buildGroup(),
              buildLiveLocation(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPersonalInfo() => SimpleSettingsTile(
        title: 'Who can see my personal info',
        subtitle:
            "if you don't share your last seen,you won't be able to see other people's Last Seen",
        enabled: false,
        onTap: () => {},
      );
  Widget buildLastSeen() => RadioModalSettingsTile<int>(
        title: 'Last seen',
        settingKey: keyLastSeen,
        values: <int, String>{
          0: 'Everyone',
          1: 'Daily',
          7: 'Weekly',
          15: 'Fortnight',
          30: 'Monthly',
        },
        showTitles: true,
        enabled: true,
        selected: 0,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
  Widget buildProfilePhoto() => RadioModalSettingsTile<int>(
        title: 'Profile Photo',
        settingKey: keyProfilePhoto,
        values: <int, String>{
          0: 'Everyone',
          1: 'Daily',
          7: 'Weekly',
          15: 'Fortnight',
          30: 'Monthly',
        },
        showTitles: true,
        enabled: true,
        selected: 0,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
  Widget buildAbout() => RadioModalSettingsTile<int>(
        title: 'About',
        settingKey: keyAbout,
        values: <int, String>{
          0: 'Everyone',
          1: 'Daily',
          7: 'Weekly',
          15: 'Fortnight',
          30: 'Monthly',
        },
        showTitles: true,
        enabled: true,
        selected: 0,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
  Widget buildStatus() => RadioModalSettingsTile<int>(
        title: 'Status',
        settingKey: keyStatus,
        values: <int, String>{
          0: 'Everyone',
          1: 'Daily',
          7: 'Weekly',
          15: 'Fortnight',
          30: 'Monthly',
        },
        showTitles: true,
        enabled: true,
        selected: 0,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
  Widget buildReadReceipts() => SwitchSettingsTile(
        title: "Read Receipts",
        subtitle:
            "if turned off, you won't send or receive Read receipts. Read receipts always sent for group chats.",
        settingKey: keyReadReceipts,
      );
  Widget buildGroup() => RadioModalSettingsTile<int>(
        title: 'Group',
        settingKey: keyGroup,
        values: <int, String>{
          0: 'Everyone',
          1: 'Daily',
          7: 'Weekly',
          15: 'Fortnight',
          30: 'Monthly',
        },
        showTitles: true,
        enabled: true,
        selected: 0,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
  Widget buildLiveLocation() => SimpleSettingsTile(
        title: "Live Location",
        subtitle: 'None',
      );
  Widget buildSync() => RadioModalSettingsTile<int>(
        title: 'Preferred Sync Period',
        settingKey: keyRadio,
        values: <int, String>{
          0: 'Never',
          1: 'Daily',
          7: 'Weekly',
          15: 'Fortnight',
          30: 'Monthly',
        },
        showTitles: true,
        enabled: true,
        selected: 0,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
}
