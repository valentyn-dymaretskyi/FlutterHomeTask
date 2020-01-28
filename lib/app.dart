import 'package:home_task/screens/auth_screen.dart';
import 'package:home_task/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRootWidget extends StatefulWidget {
  @override
  AppRootWidgetState createState() => AppRootWidgetState();
}

class AppRootWidgetState extends State<AppRootWidget> {
  ThemeData get _themeData => ThemeData(
    primaryColor: Colors.cyan,
    accentColor: Colors.indigo,
    scaffoldBackgroundColor: Colors.grey[300],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themeData,
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        '/auth': (BuildContext context) => AuthScreen(),
      },
    );
  }
}