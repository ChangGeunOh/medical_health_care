import 'package:medical_health_care/domain/model/account_data.dart';
import 'package:medical_health_care/domain/model/user_data.dart';

abstract class NetworkSource {
  Future<UserData> login(Map<String, dynamic> loginData);
}
