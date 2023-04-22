import 'package:medical_health_care/domain/model/doctor_data.dart';

class HomeState {
  final List<String> symptoms;
  final List<DoctorData> popularDoctors;

  HomeState({
    List<String>? symptoms,
    List<DoctorData>? popularDoctors,
  })  : symptoms = symptoms ?? const ['Temperature', 'Snuffle', 'Fever'],
        popularDoctors = popularDoctors ?? List.empty();

  HomeState copyWith({
    List<String>? symptoms,
    List<DoctorData>? popularDoctors,
  }) {
    return HomeState(
      symptoms: symptoms ?? this.symptoms,
      popularDoctors: popularDoctors ?? this.popularDoctors,
    );
  }
}
