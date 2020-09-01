import 'package:flutter/material.dart';
import 'package:mytoptracks/app/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  final controller = SplashController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/headphone.png',
          color: Colors.green,
        ),
      ),
    );
  }
}
