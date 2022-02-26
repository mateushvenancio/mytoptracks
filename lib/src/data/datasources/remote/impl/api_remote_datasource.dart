import 'package:dio/dio.dart';
import 'package:mytoptracks/src/data/datasources/remote/i_remote_datasource.dart';

class ApiRemoteDatasource implements IRemoteDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.spotify.com/v1/me/top',
      responseType: ResponseType.json,
    ),
  );

  String? _token;

  set token(String value) => _token = value;

  @override
  Future<Object?> gett(String url) async {
    if (_token == null) {}
    return await dio.get(url);
  }

  @override
  Future<Object?> post(String url, {Map<String, dynamic>? data}) async {
    return await dio.post(url, data: data);
  }
}
