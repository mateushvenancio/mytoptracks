import 'package:mytoptracks/src/data/datasources/remote/i_remote_datasource.dart';
import 'package:mytoptracks/src/data/models/artist_model.dart';
import 'package:mytoptracks/src/domain/entities/artist_entity.dart';
import 'package:mytoptracks/src/core/enums/terms_enum.dart';
import 'package:mytoptracks/src/domain/repositories/i_artists_repository.dart';

class ApiArtistsRepository implements IArtistsRepository {
  final IRemoteDataSource api;

  ApiArtistsRepository(this.api);

  @override
  Future<List<ArtistEntity>> getArtists(Terms term, String token) async {
    final result = await api.get(
      '/artists?limit=20&time_range=${term.label()}',
      headers: {'Authorization': token},
    );

    print('Result get artists: $result');

    return <ArtistModel>[];
  }
}
