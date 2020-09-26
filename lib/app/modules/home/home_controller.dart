import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mytoptracks/stores/artists_store.dart';
import 'package:mytoptracks/stores/tracks_store.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final artistsStore = Modular.get<ArtistsStore>();
  final tracksStore = Modular.get<TracksStore>();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
