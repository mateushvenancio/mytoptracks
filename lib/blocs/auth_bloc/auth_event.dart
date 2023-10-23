abstract class AuthEvent {}

class InitAuthEvent extends AuthEvent {}

class CodeAuthEvent extends AuthEvent {
  final String code;
  CodeAuthEvent(this.code);
}

class GetItemsAuthEvent extends AuthEvent {
  GetItemsAuthEvent();
}

class LogoutAuthEvent extends AuthEvent {}
