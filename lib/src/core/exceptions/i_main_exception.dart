abstract class IMainException {
  String? _message;

  IMainException([this._message]);

  String get message => _message ?? 'Ocorreu um erro';
  set message(String? value) => _message = value;
}
