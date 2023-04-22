import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/common/const/color.dart';
import 'package:medical_health_care/common/utils/extensions.dart';
import 'package:medical_health_care/domain/model/schedule_data.dart';
import 'package:medical_health_care/presentation/component/custom_sliver_app_bar.dart';
import 'package:medical_health_care/presentation/component/default_layout.dart';
import 'package:medical_health_care/presentation/component/icon_title.dart';
import 'package:medical_health_care/presentation/screen/schedule/bloc/schedule_bloc.dart';
import 'package:medical_health_care/presentation/screen/schedule/bloc/schedule_event.dart';
import 'package:medical_health_care/presentation/screen/schedule/bloc/schedule_state.dart';

import 'component/schedule_segment.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout<ScheduleBloc, ScheduleState>(
      backgroundColor: Colors.white,
      create: (context) => ScheduleBloc(context),
      builder: (context, bloc, state) {
        return CustomScrollView(
          slivers: [
            const CustomSliverAppBar(title: 'Schedule'),
            SliverToBoxAdapter(
              child: ScheduleSegment(
                scheduleType: state.scheduleType,
                onChange: (value) => bloc.add(
                  ScheduleEvent(
                    ScheduleEventType.scheduleType,
                    extra: value,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                state.schedules
                    .map(
                      (e) => ScheduleCard(
                        scheduleData: e,
                        onCancel: () {},
                        onReschedule: () {},
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onReschedule;
  final ScheduleData scheduleData;

  const ScheduleCard({
    required this.scheduleData,
    required this.onCancel,
    required this.onReschedule,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      height: 190,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    scheduleData.name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    scheduleData.major,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                backgroundImage: AssetImage(scheduleData.image),
              )
            ],
          ),
          SizedBox(height: 8.w),
          const Divider(),
          SizedBox(height: 8.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconTitle(
                iconData: Icons.calendar_month,
                text: scheduleData.scheduleTime.toDate(),
                iconColor: Colors.black38,
              ),
              IconTitle(
                iconData: Icons.watch_later,
                text: scheduleData.scheduleTime.toTime(),
                iconColor: Colors.black38,
              ),
              IconTitle(
                iconData: Icons.fiber_manual_record,
                text: scheduleData.state.name.capitalize(),
                iconColor: primaryColor,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 140,
                height: 40,
                child: ElevatedButton(
                  onPressed: onCancel,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white70)),
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                height: 40,
                child: ElevatedButton(
                  onPressed: onReschedule,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ),
                  child: const Text(
                    'RESCHEDULE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
