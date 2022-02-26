import 'package:mytoptracks/src/core/enums/terms_enum.dart';
import 'package:mytoptracks/src/domain/entities/track_entity.dart';

abstract class ITrackRepository {
  Future<List<TrackEntity>> getTracks(Terms terms);
}
