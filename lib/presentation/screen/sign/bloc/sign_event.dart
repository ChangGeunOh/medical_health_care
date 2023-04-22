class SignEvent {
  final SignEventType type;
  final dynamic extra;

  SignEvent(
    this.type, {
    this.extra,
  });
}

enum SignEventType { create, login }
