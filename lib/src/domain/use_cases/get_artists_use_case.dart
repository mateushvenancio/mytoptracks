import 'package:mytoptracks/src/core/consts.dart';
import 'package:mytoptracks/src/core/enums/terms_enum.dart';
import 'package:mytoptracks/src/core/exceptions/impl/main_exception.dart';
import 'package:mytoptracks/src/domain/entities/artist_entity.dart';
import 'package:mytoptracks/src/domain/repositories/i_artists_repository.dart';
import 'package:mytoptracks/src/domain/repositories/i_local_store_repository.dart';

class GetArtistsUseCase {
  final IArtistsRepository repository;
  final ILocalStoreRepository local;

  GetArtistsUseCase(this.repository, this.local);

  Future<List<ArtistEntity>> execute(Terms term) async {
    final token = await local.getString(Consts.localTokenPath);
    if (token == null) {
      throw MainException.noToken();
    }
    return await repository.getArtists(term, token);
  }
}
