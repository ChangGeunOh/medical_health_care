import 'package:json_annotation/json_annotation.dart';

part 'recent_chat_data.g.dart';

@JsonSerializable()
class RecentChatData {
  final String name, lastMessage, image;
  final int lastDate;

  RecentChatData({
    required this.name,
    required this.image,
    required this.lastMessage,
    int? lastDate,
  }): lastDate = lastDate ??  DateTime.now().millisecondsSinceEpoch;
}