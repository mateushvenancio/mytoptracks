import 'package:flutter/material.dart';
import 'package:mytoptracks/app/login/login_page.dart';

class SplashController {
  //autenticar

  init(context) async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
