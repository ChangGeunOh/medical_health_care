import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'account_data.g.dart';

@JsonSerializable()
class AccountData {
  final String uuid;
  final String name;
  final String email;
  final String phone;
  final String password;

  AccountData({
    String? uuid,
    String? name,
    String? email,
    String? phone,
    String? password,
  })  : uuid = uuid ?? const Uuid().v4.toString(),
        name = name ?? '',
        email = email ?? '',
        phone = phone ?? '',
        password = password ?? '';

  AccountData copyWith({
    String? uuid,
    String? name,
    String? email,
    String? phone,
    String? password,
  }) {
    return AccountData(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() => _$AccountDataToJson(this);
  factory AccountData.fromJson(Map<String, dynamic> json) => _$AccountDataFromJson(json);
}
