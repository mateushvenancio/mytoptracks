import 'package:flutter/material.dart';
import 'package:mytoptracks/app/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = SplashController();

  @override
  void initState() {
    controller.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/headphone.png',
          height: 100,
          width: 100,
          color: Colors.green,
        ),
      ),
    );
  }
}
