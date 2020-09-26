import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mytoptracks/stores/artists_store.dart';
import 'package:mytoptracks/stores/auth_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final authStore = Modular.get<AuthStore>();

  @observable
  bool isLoading = false;

  @action
  getCode() async {
    isLoading = true;

    await authStore.getCode();
    Modular.to.pushReplacementNamed('/home');

    isLoading = false;
  }

  @action
  initialCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('code')) {
      Modular.to.pushReplacementNamed('/home');
    } else {
      isLoading = false;
    }
  }
}
