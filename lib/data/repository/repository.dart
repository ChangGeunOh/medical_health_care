import 'package:medical_health_care/domain/model/account_data.dart';
import 'package:medical_health_care/domain/model/chat_data.dart';
import 'package:medical_health_care/domain/model/doctor_data.dart';
import 'package:medical_health_care/domain/model/recent_chat_data.dart';
import 'package:medical_health_care/domain/model/schedule_data.dart';
import 'package:medical_health_care/domain/model/user_data.dart';
import 'package:medical_health_care/domain/repository/database_source.dart';
import 'package:medical_health_care/domain/repository/datastore_source.dart';
import 'package:medical_health_care/domain/repository/network_source.dart';
import 'package:medical_health_care/presentation/screen/schedule/component/schedule_segment.dart';

import '../../common/const/database.dart';

class Repository {
  final DatabaseSource _database;
  final DataStoreSource _datsStore;
  final NetworkSource _network;

  Repository({
    required DatabaseSource databaseSource,
    required DataStoreSource dataStoreSource,
    required NetworkSource networkSource,
  })  : _database = databaseSource,
        _datsStore = dataStoreSource,
        _network = networkSource;

  Future<UserData> login(
      {required String userid, required String passwd}) async {
    final loginData = {'username': 'kminchelle', 'password': '0lelplR'};
    return await _network.login(loginData);
  }

  Future<List<DoctorData>> getPopularDoctors() async {
    return await _database.getPopularDoctors();
  }

  Future<List<ScheduleData>>getSchedules(ScheduleType scheduleType) async{
    return await _database.getSchedules(scheduleType);
  }

  Future<List<DoctorData>> getActiveDoctors() async {
    return await _database.getActiveDoctors();
  }

  Future<List<RecentChatData>> getRecentChats() async {
    return kRecentChatData;
  }

  Future<List<ChatData>>getChatList() async {
    return kChats;
  }

}
