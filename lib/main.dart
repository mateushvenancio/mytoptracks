import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
