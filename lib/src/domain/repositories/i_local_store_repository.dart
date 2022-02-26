abstract class ILocalStoreRepository {
  Future<bool> saveString(String key, String value);
  Future<String?> getString(String key);
  Future<void> clearString(String key);
}
