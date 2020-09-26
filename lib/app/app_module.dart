import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mytoptracks/app/app_widget.dart';
import 'package:mytoptracks/app/modules/home/home_module.dart';
import 'package:mytoptracks/app/modules/login/login_module.dart';
import 'package:mytoptracks/stores/artists_store.dart';
import 'package:mytoptracks/stores/auth_store.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ArtistsStore()),
        Bind((i) => AuthStore(), lazy: false),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
