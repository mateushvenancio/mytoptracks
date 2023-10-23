import 'dart:async';

import 'package:mytoptracks/repositories/local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpLocalRepository implements ILocalRepository {
  final _completer = Completer();
  final _refreshTokenKey = 'Prefs@@RefreshToken';
  late SharedPreferences _prefs;

  SpLocalRepository() {
    SharedPreferences.getInstance().then((value) {
      _prefs = value;
      _completer.complete();
    });
  }

  @override
  Future<String?> getRefreshToken() async {
    await _completer.future;
    return _prefs.getString(_refreshTokenKey);
  }

  @override
  Future<void> setRefreshToken(String token) async {
    await _completer.future;
    await _prefs.setString(_refreshTokenKey, token);
  }

  @override
  Future<void> clear() async {
    await _completer.future;
    await _prefs.clear();
  }
}
