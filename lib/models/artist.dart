class Artist {
  List<String> genres;
  String href;
  String id;
  List<String> images;
  String name;
  int popularity;
  String type;
  String uri;

  Artist({
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  Artist.fromJson(Map<String, dynamic> json) {
    genres = json['genres'].cast<String>();
    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = new List<String>();
      json['images'].forEach((v) {
        images.add(v['url']);
      });
    }
    name = json['name'];
    popularity = json['popularity'];
    type = json['type'];
    uri = json['uri'];
  }
}
