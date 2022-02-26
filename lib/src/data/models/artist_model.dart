import 'package:mytoptracks/src/domain/entities/artist_entity.dart';

class ArtistModel extends ArtistEntity {
  ArtistModel.fromJson(Map<String, dynamic> json) {
    this.id = json[''];
    this.name = json[''];
    this.images = List.from(json['images'] ?? []).map((e) {
      return e['url'].toString();
    }).toList();
    this.genres = List.from(json['genres'] ?? []);
    this.uri = json['uri'];
  }
}
