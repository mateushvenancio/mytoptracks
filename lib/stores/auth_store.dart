import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:mytoptracks/repository/api_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  StreamSubscription _sub;
  String token;

  _AuthStoreBase() {
    print('instanciou o auth store');
    _sub = getUriLinksStream().listen((event) {
      String code = event.queryParameters['code'];
      print('Código recuperado do Stream: $code');
      getToken(code);
    });
  }

  @action
  getCode() async {
    await launch(
      'https://accounts.spotify.com/authorize?client_id=${ApiKeys.clientID}&redirect_uri=${ApiKeys.redirectTo}&response_type=code&scope=user-top-read',
    );
  }

  @action
  getToken(String code) async {
    Map _map;

    final String credentials = '${ApiKeys.clientID}:${ApiKeys.clientSecret}';
    final String encodedCredentials = utf8.fuse(base64).encode(credentials);

    var response =
        await http.post('https://accounts.spotify.com/api/token', body: {
      'grant_type': 'authorization_code',
      'code': '$code',
      'redirect_uri': '${ApiKeys.redirectTo}'
    }, headers: {
      HttpHeaders.authorizationHeader: 'Basic $encodedCredentials'
    });

    _map = json.decode(response.body);

    token = _map['access_token'];
  }

  @action
  saveCode(String code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('code', code);
  }
}
