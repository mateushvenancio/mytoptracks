import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mytoptracks/constants.dart';
import 'package:mytoptracks/entities/artist_entity.dart';
import 'package:mytoptracks/entities/track_entity.dart';
import 'package:mytoptracks/repositories/spotify_api_repository.dart';

class ApiSpotifyRepository implements ISpotifyRepository {
  final b64Code = base64Encode(utf8.encode('${AppConstants.spotifyPublicKey}:${AppConstants.spotifySecretKey}'));
  final _dio = Dio();

  @override
  Future<String> refreshToken(String code) async {
    final result = await _dio.post(
      'https://accounts.spotify.com/api/token',
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Basic $b64Code',
        },
        validateStatus: (status) => (status ?? 0) < 500,
      ),
      data: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': AppConstants.spotifyRedirectUri,
      },
    );
    return (result.data as Map)['refresh_token'];
  }

  @override
  Future<String> requestNewToken(String refreshToken) async {
    final result = await _dio.post(
      'https://accounts.spotify.com/api/token',
      options: Options(
        headers: {
          'Authorization': 'Basic $b64Code',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        validateStatus: (status) => (status ?? 0) < 500,
      ),
      data: {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
      },
    );

    return (result.data as Map)['access_token'];
  }

  @override
  Future<List<ArtistEntity>> getArtists(String token) async {
    final response = await _dio.get(
      'https://api.spotify.com/v1/me/top/artists',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return [...response.data['items']].map((e) {
      return ArtistEntity(
        id: e['id'],
        name: e['name'],
        genres: [...e['genres']],
        images: [...e['images']].map((e) => e['url'].toString()).toList(),
        url: e['external_urls']['spotify'],
      );
    }).toList();
  }

  @override
  Future<List<TrackEntity>> getTracks(String token) async {
    final response = await _dio.get(
      'https://api.spotify.com/v1/me/top/tracks',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return [...response.data['items']].map((e) {
      return TrackEntity(
        id: e['id'],
        name: e['name'],
        duration: e['duration_ms'],
        url: e['href'],
        album: AlbumTrackEntity(
          id: e['album']['id'],
          name: e['album']['name'],
          images: [...e['album']['images']].map((e) {
            return e['url'].toString();
          }).toList(),
          url: e['external_urls']['spotify'],
        ),
        artists: [...e['artists']].map((el) {
          return ArtistTrackEntity(
            name: el['name'],
            url: el['href'],
          );
        }).toList(),
      );
    }).toList();
  }
}
