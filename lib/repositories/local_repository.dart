abstract interface class ILocalRepository {
  Future<void> setRefreshToken(String token);
  Future<String?> getRefreshToken();
  Future<void> clear();
}
