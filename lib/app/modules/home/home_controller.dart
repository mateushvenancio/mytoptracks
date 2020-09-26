import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mytoptracks/stores/artists_store.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final store = Modular.get<ArtistsStore>();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
