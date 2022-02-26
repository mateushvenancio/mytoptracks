import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mytoptracks/src/presenter/stores/auth_store.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(builder: (_) {
          if (GetIt.I<AuthStore>().loading) {
            return CircularProgressIndicator();
          }

          return TextButton(
            onPressed: () {},
            child: Text('Fazer login'),
          );
        }),
      ),
    );
  }
}
