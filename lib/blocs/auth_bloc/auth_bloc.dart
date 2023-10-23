import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytoptracks/blocs/auth_bloc/auth_event.dart';
import 'package:mytoptracks/blocs/auth_bloc/auth_state.dart';
import 'package:mytoptracks/repositories/local_repository.dart';
import 'package:mytoptracks/repositories/spotify_api_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ILocalRepository localRepository;
  final ISpotifyRepository spotifyRepository;

  AuthBloc({
    required this.localRepository,
    required this.spotifyRepository,
  }) : super(InitAuthState()) {
    on<InitAuthEvent>((event, emit) async {
      final refreshToken = await localRepository.getRefreshToken();
      if (refreshToken != null) {
        emit(AuthenticatedAuthState());
      } else {
        emit(UnauthenticatedAuthState());
      }
    });

    on<CodeAuthEvent>((event, emit) async {
      final token = await spotifyRepository.refreshToken(event.code);
      await localRepository.setRefreshToken(token);

      emit(AuthenticatedAuthState());
    });

    on<LogoutAuthEvent>((event, emit) async {
      await localRepository.clear();
      emit(UnauthenticatedAuthState());
    });
  }
}
