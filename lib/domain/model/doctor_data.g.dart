// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorData _$DoctorDataFromJson(Map<String, dynamic> json) => DoctorData(
      uuid: json['uuid'] as String?,
      name: json['name'] as String,
      major: json['major'] as String,
      image: json['image'] as String,
      rate: (json['rate'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$DoctorDataToJson(DoctorData instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'major': instance.major,
      'image': instance.image,
      'rate': instance.rate,
      'description': instance.description,
    };
