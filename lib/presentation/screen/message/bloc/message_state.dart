import 'package:medical_health_care/domain/model/doctor_data.dart';
import 'package:medical_health_care/domain/model/recent_chat_data.dart';

class MessageState {
  final List<DoctorData> activeDoctors;
  final List<RecentChatData> recentChats;

  MessageState({
    List<DoctorData>? activeDoctors,
    List<RecentChatData>? recentChats,
  })  : activeDoctors = activeDoctors ?? List.empty(),
        recentChats = recentChats ?? List.empty();

  MessageState copyWith({
    List<DoctorData>? activeDoctors,
    List<RecentChatData>? recentChats,
  }) {
    return MessageState(
      activeDoctors: activeDoctors ?? this.activeDoctors,
      recentChats: recentChats ?? this.recentChats,
    );
  }
}
