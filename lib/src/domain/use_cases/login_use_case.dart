import 'package:mytoptracks/src/core/consts.dart';
import 'package:mytoptracks/src/core/exceptions/impl/main_exception.dart';
import 'package:mytoptracks/src/domain/repositories/i_auth_repository.dart';
import 'package:mytoptracks/src/domain/repositories/i_local_store_repository.dart';

class LoginUseCase {
  final ILocalStoreRepository localRepository;
  final IAuthRepository authRepository;

  LoginUseCase({
    required this.localRepository,
    required this.authRepository,
  });

  execute() async {
    String? code = await localRepository.getString(Consts.localCodePath);
    if (code == null) throw MainException();
  }
}
