class HomeEvent {
  final HomeEventType type;
  final dynamic extra;

  HomeEvent(
    this.type, {
    this.extra,
  });
}

enum HomeEventType { init, button, book }
