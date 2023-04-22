import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/domain/model/recent_chat_data.dart';
import 'package:medical_health_care/presentation/component/blur_container.dart';
import 'package:medical_health_care/presentation/component/custom_sliver_app_bar.dart';
import 'package:medical_health_care/presentation/component/default_layout.dart';
import 'package:medical_health_care/presentation/screen/message/bloc/message_bloc.dart';
import 'package:medical_health_care/presentation/screen/message/bloc/message_event.dart';
import 'package:medical_health_care/presentation/screen/message/bloc/message_state.dart';
import 'package:medical_health_care/common/utils/extensions.dart';

import 'component/active_now_card.dart';
import 'component/recent_chat_card.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout<MessageBloc, MessageState>(
      create: (context) => MessageBloc(context),
      builder: (context, bloc, state) {
        return CustomScrollView(
          slivers: [
            const CustomSliverAppBar(title: 'Messages'),
            SliverToBoxAdapter(
              child: BlurContainer(
                backgroundColor: Colors.white,
                width: double.infinity,
                margin: EdgeInsets.all(16.w),
                padding: const EdgeInsets.all(2),
                child: TextField(
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black45,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    bloc.add(
                        MessageEvent(MessageEventType.search, extra: value));
                  },
                ),
              ),
            ),
            renderSubTitle('Active Now'),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: state.activeDoctors
                      .map(
                        (e) => ActiveNowCard(
                          image: e.image,
                          onClick: () {
                            bloc.add(
                                MessageEvent(MessageEventType.chat, extra: e));
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            renderSubTitle('Recent Chat'),
            SliverList(
              delegate: SliverChildListDelegate(
                state.recentChats
                    .map((e) => RecentChatCard(
                          recentChatData: e,
                          onClick: () {
                            bloc.add(
                                MessageEvent(MessageEventType.chat, extra: e));
                          },
                        ))
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  renderSubTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
