class TrackEntity {
  final String id;
  final String name;
  final num duration;
  final AlbumTrackEntity album;
  final List<ArtistTrackEntity> artists;
  final String url;

  TrackEntity({
    required this.id,
    required this.name,
    required this.duration,
    required this.album,
    required this.artists,
    required this.url,
  });
}

class AlbumTrackEntity {
  final String id;
  final String name;
  final List<String> images;
  final String url;

  AlbumTrackEntity({
    required this.id,
    required this.name,
    required this.images,
    required this.url,
  });
}

class ArtistTrackEntity {
  final String name;
  final String url;

  ArtistTrackEntity({
    required this.name,
    required this.url,
  });
}
