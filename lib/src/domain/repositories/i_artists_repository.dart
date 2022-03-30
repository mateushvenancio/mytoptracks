import 'package:mytoptracks/src/core/enums/terms_enum.dart';
import 'package:mytoptracks/src/domain/entities/artist_entity.dart';

abstract class IArtistsRepository {
  Future<List<ArtistEntity>> getArtists(Terms term, String token);
}
