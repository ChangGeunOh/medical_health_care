import 'package:medical_health_care/common/const/database.dart';
import 'package:medical_health_care/data/database/local_database.dart';
import 'package:medical_health_care/domain/model/doctor_data.dart';
import 'package:medical_health_care/domain/model/schedule_data.dart';
import 'package:medical_health_care/domain/repository/database_source.dart';
import 'package:medical_health_care/presentation/screen/schedule/component/schedule_segment.dart';

class DatabaseSourceImpl extends DatabaseSource {
  final LocalDatabase localDatabase;

  DatabaseSourceImpl({
    LocalDatabase? localDatabase,
  }) : localDatabase = localDatabase ?? LocalDatabase();

  @override
  Future<List<DoctorData>> getPopularDoctors() async {
    final db = await localDatabase.database;
    final list = await db.query(kTableDoctor);
    final doctors = list.map((e) => DoctorData.fromJson(e)).toList();
    print('get>${doctors.toString()}');
    return doctors;
  }

  @override
  Future<List<ScheduleData>> getSchedules(ScheduleType scheduleType) async {
    final db = await localDatabase.database;
    final list = await db.query(kTableSchedule, where: 'state = ?', whereArgs: [ scheduleType.name ]);
    final schedules = list.map((e) => ScheduleData.fromJson(e)).toList();
    print(schedules.toString());
    return schedules;
  }

  @override
  Future<List<DoctorData>> getActiveDoctors() async {
    final db = await localDatabase.database;
    final list = await db.query(kTableDoctor);
    final doctors = list.map((e) => DoctorData.fromJson(e)).toList();
    return doctors;
  }
}
