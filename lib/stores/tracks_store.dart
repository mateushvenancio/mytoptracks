// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:mobx/mobx.dart';
// import 'package:mytoptracks/models/track.dart';
// import 'package:mytoptracks/stores/auth_store.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// part 'tracks_store.g.dart';

// class TracksStore = _TracksStoreBase with _$TracksStore;

// abstract class _TracksStoreBase with Store {
//   // final authStore = Modular.get<AuthStore>();

//   @observable
//   List<Track> short = [];
//   @observable
//   List<Track> medium = [];
//   @observable
//   List<Track> long = [];

//   @action
//   getTracks(String token) async {
//     // String token = authStore.token;

//     short = await fetchTracks(token, 'short_term');
//     medium = await fetchTracks(token, 'medium_term');
//     long = await fetchTracks(token, 'long_term');
//   }

//   @action
//   Future<List<Track>> fetchTracks(String token, String term) async {
//     List<Track> tracks = [];

//     String head = 'Bearer $token';

//     var resp = await http.get(
//       'https://api.spotify.com/v1/me/top/tracks?limit=20&time_range=' + term,
//       headers: {'Authorization': head},
//     );

//     Map _map = json.decode(resp.body);

//     if (_map['items'] != null) {
//       _map['items'].forEach((element) {
//         tracks.add(Track.fromJson(element));
//       });
//     }

//     return tracks;
//   }
// }
