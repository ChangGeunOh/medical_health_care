class BookEvent {
  final BookEventType type;
  final dynamic extra;

  BookEvent(
    this.type, {
    this.extra,
  });
}

enum BookEventType {
  init, book, phone, message
}
