import 'package:json_annotation/json_annotation.dart';
import 'package:medical_health_care/presentation/screen/schedule/component/schedule_segment.dart';
import 'package:uuid/uuid.dart';

part 'schedule_data.g.dart';

@JsonSerializable()
class ScheduleData {
  final String uuid, name, major, image;
  final int scheduleTime;
  final ScheduleType state;

  ScheduleData({
    String? uuid,
    required this.name,
    required this.major,
    required this.image,
    int? scheduleTime,
    ScheduleType? state,
  })  : uuid = uuid ?? const Uuid().v4(),
        scheduleTime = scheduleTime ?? DateTime.now().millisecondsSinceEpoch,
        state = state ?? ScheduleType.upcoming;

  Map<String, dynamic> toJson() => _$ScheduleDataToJson(this);

  factory ScheduleData.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDataFromJson(json);
}
