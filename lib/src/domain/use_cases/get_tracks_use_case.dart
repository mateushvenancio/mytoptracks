import 'package:mytoptracks/src/domain/entities/track_entity.dart';
import 'package:mytoptracks/src/domain/repositories/i_tracks_repository.dart';

class GetTracksUseCase {
  final ITrackRepository repository;

  GetTracksUseCase(this.repository);

  Future<List<TrackEntity>> execute() async {
    return await repository.getTracks();
  }
}
