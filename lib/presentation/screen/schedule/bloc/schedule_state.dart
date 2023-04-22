import 'package:medical_health_care/domain/model/schedule_data.dart';
import 'package:medical_health_care/presentation/screen/schedule/schedule_screen.dart';

import '../component/schedule_segment.dart';

class ScheduleState {
  final ScheduleType scheduleType;
  final List<ScheduleData> schedules;

  ScheduleState({
    ScheduleType? scheduleType,
    List<ScheduleData>? schedules,
  })  : scheduleType = scheduleType ?? ScheduleType.upcoming,
        schedules = schedules ?? List.empty();

  ScheduleState copyWith({
    ScheduleType? scheduleType,
    List<ScheduleData>? schedules,
  }) {
    return ScheduleState(
      scheduleType: scheduleType ?? this.scheduleType,
      schedules: schedules ?? this.schedules,
    );
  }
}
