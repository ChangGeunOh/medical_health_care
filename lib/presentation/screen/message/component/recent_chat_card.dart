import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/common/utils/extensions.dart';
import 'package:medical_health_care/domain/model/recent_chat_data.dart';

class RecentChatCard extends StatelessWidget {
  final VoidCallback onClick;
  final RecentChatData recentChatData;

  const RecentChatCard({
    Key? key,
    required this.recentChatData,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(recentChatData.image),
              radius: 30,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recentChatData.name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    recentChatData.lastMessage,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black45,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Text(
              recentChatData.lastDate.toTime(),
              style: const TextStyle(
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}