import 'package:mytoptracks/src/core/exceptions/i_main_exception.dart';

class ApiException extends IMainException {
  ApiException([String? message]) : super(message);
}
