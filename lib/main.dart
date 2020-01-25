import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/profile/profile.dart';
import 'package:my_app/pages/trending/trending.dart';
import 'package:my_app/pages/setting/setting.dart';
import 'package:my_app/pages/setting/setting_language.dart';
import 'package:my_app/pages/about.dart';
import 'package:my_app/routes.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          )),
      routes: {
        MyAppRoutes.login: (context) => LoginPage(),
        MyAppRoutes.home: (context) => MainPage(),
        MyAppRoutes.profile: (context) => ProfilePage(),
        MyAppRoutes.trending: (context) => TrendingPage(),
        MyAppRoutes.setting: (context) => SettingPage(),
        MyAppRoutes.settingLanguage: (context) => SettingLanguagePage(),
        MyAppRoutes.about: (context) => AboutPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case MyAppRoutes.root:
            return MaterialPageRoute(builder: (context) => LoginPage());
          default:
            return MaterialPageRoute(builder: (context) => LoginPage());
        }
      },
    );
  }
}
