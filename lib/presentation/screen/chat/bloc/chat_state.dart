import 'package:medical_health_care/domain/model/chat_data.dart';

class ChatState {
  final List<ChatData> chats;

  ChatState({
    List<ChatData>? chats,
  }) : chats = chats ?? List.empty();

  ChatState copyWith({List<ChatData>? chats}) {
    return ChatState(
      chats: chats ?? this.chats,
    );
  }
}
