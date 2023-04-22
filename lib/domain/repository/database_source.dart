import 'package:medical_health_care/domain/model/doctor_data.dart';
import 'package:medical_health_care/domain/model/schedule_data.dart';
import 'package:medical_health_care/presentation/screen/schedule/component/schedule_segment.dart';

abstract class DatabaseSource {
  Future<List<DoctorData>> getPopularDoctors();

  Future<List<ScheduleData>> getSchedules(ScheduleType scheduleType);

  Future<List<DoctorData>> getActiveDoctors();

}
