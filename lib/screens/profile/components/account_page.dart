import 'package:queuechat/screens/profile/components/accountScreen/change_number.dart';
import 'package:queuechat/screens/profile/components/accountScreen/delete_account.dart';
import 'package:queuechat/screens/profile/components/accountScreen/request_account_info.dart';
import 'package:queuechat/screens/profile/components/accountScreen/security.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'accountScreen/privacy.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: "Account",
      subtitle: "Privacy, Security, Language",
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      child: SettingsScreen(
        title: 'Account Settings',
        children: [
          // xbuildLanguage(),
          // buildLocation(),
          // buildPassword(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Privacy(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Security(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ChangeNumber(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          RequestAccountInfo(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          DeleteAccount(),
        ],
      ),
    );
  }

  Widget buildLocation() => TextInputSettingsTile(
        title: 'Location',
        settingKey: keyLocation,
        initialValue: 'India',
        onChange: (location) {},
      );
  Widget buildPassword() => TextInputSettingsTile(
        title: 'Password',
        settingKey: keyPassword,
        obscureText: true,
        validator: (password) => password != Null && password.length >= 6
            ? null
            : 'Enter 6 characters',
      );
  Widget buildLanguage() => DropDownSettingsTile(
        subtitle: "",
        title: 'Language',
        settingKey: keyLanguage,
        selected: 1,
        values: <int, String>{
          0: 'English',
          1: 'Spanish',
          2: 'Chinese',
          3: 'Hindi',
        },
        onChange: (language) {},
      );
}
