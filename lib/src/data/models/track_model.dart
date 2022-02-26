import 'package:mytoptracks/src/domain/entities/track_entity.dart';

class TrackModel extends TrackEntity {
  TrackModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.albums = json['album'];
    this.artists = json['artists'];
    this.name = json['name'];
    this.previewUrl = json['preview_url'];
    this.uri = json['uri'];
  }
}
