abstract class IRemoteDataSource {
  Future<Object?> post(String path, {Map<String, dynamic>? data});
  Future<Object?> gett(String path);
}
