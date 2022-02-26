import 'package:mytoptracks/src/core/enums/terms_enum.dart';
import 'package:mytoptracks/src/domain/entities/artist_entity.dart';
import 'package:mytoptracks/src/domain/repositories/i_artists_repository.dart';

class GetArtistsUseCase {
  final IArtistsRepository repository;

  GetArtistsUseCase(this.repository);

  Future<List<ArtistEntity>> execute(Terms term) async {
    return await repository.getArtists(term);
  }
}
