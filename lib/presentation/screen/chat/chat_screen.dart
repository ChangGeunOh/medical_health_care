import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/common/const/color.dart';
import 'package:medical_health_care/presentation/component/default_layout.dart';
import 'package:medical_health_care/presentation/screen/chat/bloc/chat_bloc.dart';

import 'bloc/chat_state.dart';
import 'component/chat_card.dart';

class ChatScreen extends StatelessWidget {
  static String get routeName => 'chat';

  static String get routePath => '/chat';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout<ChatBloc, ChatState>(
      create: (context) => ChatBloc(context),
      bottomSheet: Container(
        height: 65,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  print('add');
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.amber,
                  size: 30,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  child: TextField(
                    onChanged: (value) {},
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  size: 30,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      builder: (context, bloc, state) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: false,
              backgroundColor: primaryColor,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/doctor1.jpg'),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(child: Text('Dr.Doctor Name', style: TextStyle(overflow: TextOverflow.ellipsis),)),
                ],
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                state.chats.map((e) => ChatCard(chatData: e)).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
