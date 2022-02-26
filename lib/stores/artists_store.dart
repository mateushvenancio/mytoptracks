import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:mytoptracks/models/artist.dart';
import 'package:http/http.dart' as http;
part 'artists_store.g.dart';

class ArtistsStore = _ArtistsStoreBase with _$ArtistsStore;

abstract class _ArtistsStoreBase with Store {
  // final authStore = Modular.get<AuthStore>();

  @observable
  List<Artist> short = [];
  @observable
  List<Artist> medium = [];
  @observable
  List<Artist> long = [];

  @action
  getArtists(String token) async {
    // String token = authStore.token;

    short = await fetchArtists(token, 'short_term');
    medium = await fetchArtists(token, 'medium_term');
    long = await fetchArtists(token, 'long_term');
  }

  @action
  Future<List<Artist>> fetchArtists(String token, String term) async {
    List<Artist> artists = [];

    String head = 'Bearer $token';

    var resp = await http.get(
      'https://api.spotify.com/v1/me/top/artists?limit=20&time_range=' + term,
      headers: {'Authorization': head},
    );

    Map _map = json.decode(resp.body);

    if (_map['items'] != null) {
      _map['items'].forEach((element) {
        artists.add(Artist.fromJson(element));
      });
    }

    return artists;
  }
}
