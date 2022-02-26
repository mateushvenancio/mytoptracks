class ArtistEntity {
  final String id;
  final String name;
  final List<String> images;
  final List<String> genres;
  final String uri;

  ArtistEntity({
    required this.id,
    required this.name,
    required this.images,
    required this.genres,
    required this.uri,
  });
}
