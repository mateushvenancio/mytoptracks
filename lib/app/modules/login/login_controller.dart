import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mytoptracks/stores/artists_store.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final store = Modular.get<ArtistsStore>();

  @action
  void setCode(String code) {
    store.saveCode(code);
  }
}
