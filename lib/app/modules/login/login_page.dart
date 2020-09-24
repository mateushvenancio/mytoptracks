import 'dart:async';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mytoptracks/repository/api_keys.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  StreamSubscription _sub;

  @override
  void initState() {
    _sub = getUriLinksStream().listen((event) {
      controller.setCode(event.queryParameters['code']);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Login'),
          onPressed: () {
            launch(
              'https://accounts.spotify.com/authorize?client_id=${ApiKeys.clientID}&redirect_uri=${ApiKeys.redirectTo}&response_type=code&scope=user-top-read',
            );
          },
        ),
      ),
    );
  }
}
