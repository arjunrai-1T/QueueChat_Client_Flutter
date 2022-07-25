// @dart=2.9
import 'package:queuechat/screens/welcome/welcome_screen.dart';
import 'package:queuechat/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'screens/profile/settings_page.dart';

Future main() async {
  // WidgetFlutterBinding.ensureInitialized();
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final isDarkMode = Settings.getValue<bool>(SettingsPage.keyDarkMode, true);
    return ValueChangeObserver<bool>(
      cacheKey: SettingsPage.keyDarkMode,
      defaultValue: true,
      builder: (_, isDarkMode, __) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: isDarkMode
            ? darkThemeData(context).copyWith(
                accentColor: Colors.white,
                scaffoldBackgroundColor: Color(0xFF170635),
                canvasColor: Color(0xFF170635),
              )
            : lightThemeData(context).copyWith(
                accentColor: Colors.black,
                scaffoldBackgroundColor: Colors.white,
                canvasColor: Colors.white,
              ),
        darkTheme: darkThemeData(context).copyWith(
          accentColor: Colors.white,
          scaffoldBackgroundColor: Color(0xFF170635),
          canvasColor: Color(0xFF170635),
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
