class ChatData {
  final ChatDataType type;
  final String message;
  final int regDate;

  ChatData({
    required this.type,
    required this.message,
    int? regDate,
  }) : regDate = regDate ?? DateTime.now().millisecondsSinceEpoch;
}

enum ChatDataType { receive, send }
