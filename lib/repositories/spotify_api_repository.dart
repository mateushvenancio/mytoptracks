import 'package:mytoptracks/entities/artist_entity.dart';
import 'package:mytoptracks/entities/track_entity.dart';

abstract interface class ISpotifyRepository {
  Future<String> refreshToken(String code);
  Future<String> requestNewToken(String refreshToken);
  Future<List<TrackEntity>> getTracks(String token);
  Future<List<ArtistEntity>> getArtists(String token);
}
