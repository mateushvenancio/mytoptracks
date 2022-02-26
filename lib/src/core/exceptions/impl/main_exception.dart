import 'package:mytoptracks/src/core/enums/error_type_enum.dart';
import 'package:mytoptracks/src/core/exceptions/i_main_exception.dart';

class MainException extends IMainException {
  ErrorType errorType = ErrorType.unknown;

  MainException([String? message]) : super(message);

  MainException.noToken([String? message]) : super(message) {
    this.errorType = ErrorType.noToken;
  }
}
