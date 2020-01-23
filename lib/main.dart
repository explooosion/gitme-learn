import 'package:flutter/material.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/routes.dart';

void main() => runApp(MyApp());

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
