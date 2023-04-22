class ScheduleEvent {
  final ScheduleEventType type;
  final dynamic extra;

  ScheduleEvent(
    this.type, {
    this.extra,
  });
}

enum ScheduleEventType {
  init, scheduleType,
}
