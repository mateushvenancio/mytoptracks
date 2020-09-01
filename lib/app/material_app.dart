import 'package:flutter/material.dart';
import 'package:mytoptracks/app/splash/splash_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      home: SplashPage(),
    );
  }
}
