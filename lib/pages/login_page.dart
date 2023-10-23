import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytoptracks/blocs/auth_bloc/auth_bloc.dart';
import 'package:mytoptracks/blocs/auth_bloc/auth_event.dart';
import 'package:mytoptracks/constants.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late StreamSubscription _sub;

  launchLogin() async {
    final uri = Uri(
      scheme: 'https',
      host: 'accounts.spotify.com',
      path: 'authorize',
      queryParameters: {
        'client_id': AppConstants.spotifyPublicKey,
        'response_type': 'code',
        'redirect_uri': AppConstants.spotifyRedirectUri,
        'scope': AppConstants.spotifyScopes,
      },
    );

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  void initState() {
    _sub = uriLinkStream.listen((event) {
      final code = event?.queryParameters['code'];
      if (event == null || code == null) return;
      context.read<AuthBloc>().add(CodeAuthEvent(code));
    });
    super.initState();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: launchLogin,
          child: Text('LOGIN'),
        ),
      ),
    );
  }
}
