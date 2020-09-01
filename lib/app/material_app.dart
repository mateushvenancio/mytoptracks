import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mytoptracks/app/splash/splash_page.dart';
import 'repositories/spotify_repository.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;

    getIt.registerSingleton<SpotifyRepository>(SpotifyRepository());

    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
      home: SplashPage(),
    );
  }
}
