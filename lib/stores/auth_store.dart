import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:mytoptracks/repository/api_keys.dart';
import 'package:mytoptracks/stores/artists_store.dart';
import 'package:mytoptracks/stores/tracks_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final artistsStore = Modular.get<ArtistsStore>();
  final tracksStore = Modular.get<TracksStore>();
  StreamSubscription _sub;
  String token;

  _AuthStoreBase() {
    _sub = getUriLinksStream().listen((event) async {
      String code = event.queryParameters['code'];
      await getToken(code);
      await artistsStore.getArtists(token);
      await tracksStore.getTracks(token);
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
