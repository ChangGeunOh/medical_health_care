class LoginEvent {
  final LoginEventType type;
  final dynamic extra;

  LoginEvent(
    this.type, {
    this.extra,
  });
}

enum LoginEventType { login, password, create, cancel }
