class AlbumEntity {
  final String id;
  final String name;
  final List<String> images;
  final String uri;

  AlbumEntity({
    required this.id,
    required this.images,
    required this.name,
    required this.uri,
  });
}
