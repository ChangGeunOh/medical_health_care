// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleData _$ScheduleDataFromJson(Map<String, dynamic> json) => ScheduleData(
      uuid: json['uuid'] as String?,
      name: json['name'] as String,
      major: json['major'] as String,
      image: json['image'] as String,
      scheduleTime: json['scheduleTime'] as int?,
      state: $enumDecodeNullable(_$ScheduleTypeEnumMap, json['state']),
    );

Map<String, dynamic> _$ScheduleDataToJson(ScheduleData instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'major': instance.major,
      'image': instance.image,
      'scheduleTime': instance.scheduleTime,
      'state': _$ScheduleTypeEnumMap[instance.state]!,
    };

const _$ScheduleTypeEnumMap = {
  ScheduleType.upcoming: 'upcoming',
  ScheduleType.completed: 'completed',
  ScheduleType.canceled: 'canceled',
};
