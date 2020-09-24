import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mytoptracks/models/artist.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:mytoptracks/repository/api_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'artists_store.g.dart';

@Injectable()
class ArtistsStore = _ArtistsStoreBase with _$ArtistsStore;

abstract class _ArtistsStoreBase with Store {
  @observable
  List<Artist> short = [];
  @observable
  List<Artist> medium = [];
  @observable
  List<Artist> long = [];

  @action
  getArtists() async {
    String code;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('code')) {
      code = prefs.getString('code');
      await getToken(code);
    }
  }

  @action
  getToken(String code) async {
    final String credentials = '${ApiKeys.clientID}:${ApiKeys.clientSecret}';
    final String encodedCredentials = utf8.fuse(base64).encode(credentials);

    var response = await http.post(ApiKeys.url, body: {
      'grant_type': 'authorization_code',
      'code': '$code',
      'redirect_uri': '${ApiKeys.redirectTo}'
    }, headers: {
      HttpHeaders.authorizationHeader: 'Basic $encodedCredentials'
    });

    print('Resposta getToken: ' + response.body);
  }

  @action
  saveCode(String code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('code', code);
  }
}
