import 'package:mobx/mobx.dart';
import 'package:mytoptracks/src/domain/repositories/i_auth_repository.dart';
import 'package:mytoptracks/src/domain/repositories/i_local_store_repository.dart';
import 'package:mytoptracks/src/domain/use_cases/login_use_case.dart';
part 'auth_store.g.dart';

class AuthStore extends _AuthStoreBase with _$AuthStore {
  AuthStore(ILocalStoreRepository local, IAuthRepository auth) {
    super.loginUseCase = LoginUseCase(
      localRepository: local,
      authRepository: auth,
    );
  }
}

abstract class _AuthStoreBase with Store {
  late final LoginUseCase loginUseCase;

  @observable
  bool loading = false;

  @action
  login() async {
    loading = true;

    loading = false;
  }
}
