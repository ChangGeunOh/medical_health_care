import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:medical_health_care/common/const/color.dart';
import 'package:medical_health_care/domain/model/chat_data.dart';


class ChatCard extends StatelessWidget {
  final ChatData chatData;

  const ChatCard({
    Key? key,
    required this.chatData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Alignment? aliment;
    EdgeInsets? margin = const EdgeInsets.only(top: 20, left: 16);
    EdgeInsets? padding =
    const EdgeInsets.only(left: 32, right: 16, top: 10, bottom: 10);
    var bubbleType = BubbleType.receiverBubble;
    var backgroundColor = const Color(0xffE7E7ED);
    var textColor = Colors.black;
    if (chatData.type == ChatDataType.send) {
      aliment = Alignment.topRight;
      margin = const EdgeInsets.only(top: 20, right: 16);
      padding = null;
      backgroundColor = primaryColor;
      bubbleType = BubbleType.sendBubble;
      textColor = Colors.white;
    }

    return ChatBubble(
      clipper: ChatBubbleClipper1(type: bubbleType),
      backGroundColor: backgroundColor,
      margin: margin,
      padding: padding,
      alignment: aliment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          chatData.message,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}