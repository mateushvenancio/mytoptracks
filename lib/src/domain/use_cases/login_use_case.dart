import 'dart:async';
import 'package:mytoptracks/src/core/consts.dart';
import 'package:mytoptracks/src/core/exceptions/impl/main_exception.dart';
import 'package:mytoptracks/src/domain/repositories/i_auth_repository.dart';
import 'package:mytoptracks/src/domain/repositories/i_local_store_repository.dart';

class LoginUseCase {
  final ILocalStoreRepository local;
  final IAuthRepository auth;

  LoginUseCase({
    required this.local,
    required this.auth,
  });

  execute() async {
    String? code = await local.getString(Consts.localCodePath);
    if (code == null) {
      await auth.launchCode();
      Stream<String> _listen = auth.listenCode();
      Completer _completer = Completer();
      _listen.listen((event) {
        code = event;
        _completer.complete();
      });
      await _completer.future;
    }
    if (code == null) throw MainException();
    final token = await auth.getToken(code!);
    await local.saveString(Consts.localTokenPath, token);
  }
}
