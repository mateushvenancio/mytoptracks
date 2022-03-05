abstract class IAuthRepository {
  Future<String> getToken(String code);
  Future<String> refreshToken();
  Future<void> launchCode();
  Stream<String> listenCode();
}
