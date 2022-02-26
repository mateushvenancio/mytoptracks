import 'package:mytoptracks/src/domain/entities/album_entity.dart';

class AlbumModel extends AlbumEntity {
  AlbumModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.images = List.from(json['images'] ?? []).map((e) {
      return e['url'].toString();
    }).toList();
    this.uri = json['uri'];
  }
}
