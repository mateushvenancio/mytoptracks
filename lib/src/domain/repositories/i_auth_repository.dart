abstract class IAuthRepository {
  Future<String> getToken();
  Future<String> refreshToken();
  Future<String> getCode();
}
