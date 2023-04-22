import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'doctor_data.g.dart';

@JsonSerializable()
class DoctorData {
  final String uuid;
  final String name;
  final String major;
  final String image;
  final double rate;
  final String description;

  DoctorData({
    String? uuid,
    required this.name,
    required this.major,
    required this.image,
    required this.rate,
    required this.description,
  }): uuid = uuid ?? const Uuid().v4();


  factory DoctorData.fromJson(Map<String, dynamic> json) => _$DoctorDataFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorDataToJson(this);
}
