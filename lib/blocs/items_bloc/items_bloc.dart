import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytoptracks/blocs/items_bloc/items_event.dart';
import 'package:mytoptracks/blocs/items_bloc/items_state.dart';
import 'package:mytoptracks/entities/artist_entity.dart';
import 'package:mytoptracks/entities/track_entity.dart';
import 'package:mytoptracks/repositories/local_repository.dart';
import 'package:mytoptracks/repositories/spotify_api_repository.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final ILocalRepository localRepository;
  final ISpotifyRepository spotifyRepository;

  ItemsBloc({
    required this.localRepository,
    required this.spotifyRepository,
  }) : super(LoadingItemsState()) {
    on<GetItemsEvent>((event, emit) async {
      emit(LoadingItemsState());

      final refreshToken = await localRepository.getRefreshToken();
      final token = await spotifyRepository.requestNewToken(refreshToken!);

      final [artists as List<ArtistEntity>, tracks as List<TrackEntity>] = await Future.wait([
        spotifyRepository.getArtists(token),
        spotifyRepository.getTracks(token),
      ]);

      emit(SuccessItemsState(artists: artists, tracks: tracks));
    });
  }
}
