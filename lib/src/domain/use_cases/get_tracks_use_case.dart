import 'package:mytoptracks/src/core/consts.dart';
import 'package:mytoptracks/src/core/enums/terms_enum.dart';
import 'package:mytoptracks/src/core/exceptions/impl/main_exception.dart';
import 'package:mytoptracks/src/domain/entities/track_entity.dart';
import 'package:mytoptracks/src/domain/repositories/i_local_store_repository.dart';
import 'package:mytoptracks/src/domain/repositories/i_tracks_repository.dart';

class GetTracksUseCase {
  final ITrackRepository repository;
  final ILocalStoreRepository local;

  GetTracksUseCase(this.repository, this.local);

  Future<List<TrackEntity>> execute(Terms terms) async {
    final token = await local.getString(Consts.localTokenPath);
    if (token == null) {
      throw MainException.noToken();
    }
    return await repository.getTracks(terms, token);
  }
}
