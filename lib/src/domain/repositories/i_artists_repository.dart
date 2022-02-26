import 'package:mytoptracks/src/domain/entities/artist_entity.dart';

abstract class IArtistsRepository {
  Future<List<ArtistEntity>> getArtists();
}
