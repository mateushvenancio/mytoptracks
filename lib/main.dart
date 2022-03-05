import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytoptracks/injector.dart';

void main() {
  Injector.inject();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Top Tracks',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.signikaTextTheme(),
      ),
      initialRoute: '/',
      onGenerateRoute: (_) {},
    );
  }
}
