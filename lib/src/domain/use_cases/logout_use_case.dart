import 'package:mytoptracks/src/core/consts.dart';
import 'package:mytoptracks/src/domain/repositories/i_local_store_repository.dart';

class LogoutUseCase {
  final ILocalStoreRepository repository;

  LogoutUseCase(this.repository);

  execute() async {
    await repository.clearString(Consts.localCodePath);
    await repository.clearString(Consts.localTokenPath);
  }
}
