import 'package:mytoptracks/src/domain/entities/album_entity.dart';
import 'package:mytoptracks/src/domain/entities/artist_entity.dart';

class TrackEntity {
  late final String id;
  late final String name;
  late final String previewUrl;
  late final String uri;
  late final List<ArtistEntity> artists;
  late final List<AlbumEntity> albums;
}
