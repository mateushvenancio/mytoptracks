import 'package:mytoptracks/entities/artist_entity.dart';
import 'package:mytoptracks/entities/track_entity.dart';

abstract class ItemsState {}

class LoadingItemsState extends ItemsState {}

class SuccessItemsState extends ItemsState {
  final List<TrackEntity> tracks;
  final List<ArtistEntity> artists;

  SuccessItemsState({
    required this.tracks,
    required this.artists,
  });
}
