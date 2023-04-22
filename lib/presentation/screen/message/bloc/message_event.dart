class MessageEvent {
  final MessageEventType type;
  final dynamic extra;

  MessageEvent(
    this.type, {
    this.extra,
  });
}

enum MessageEventType {
  init, search, chat,
}
