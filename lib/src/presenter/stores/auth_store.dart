import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mytoptracks/src/domain/repositories/i_auth_repository.dart';
import 'package:mytoptracks/src/domain/repositories/i_local_store_repository.dart';
import 'package:mytoptracks/src/domain/use_cases/login_use_case.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final loginUc = LoginUseCase(
    auth: GetIt.I<IAuthRepository>(),
    local: GetIt.I<ILocalStoreRepository>(),
  );

  @observable
  bool loading = false;

  @action
  login() async {
    loading = true;

    try {
      await loginUc.execute();
    } catch (e) {}

    // final url = 'https://accounts.spotify.com/authorize?client_id=ApiKeys.clientID&redirect_uri=ApiKeys.redirectTo&response_type=code&scope=user-top-read';

    loading = false;
  }
}
