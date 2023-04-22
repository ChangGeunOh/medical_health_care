import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/domain/model/doctor_data.dart';

class DoctorDataInfo extends StatelessWidget {
  final DoctorData doctorData;
  final VoidCallback onCall;
  final VoidCallback onMessage;

  const DoctorDataInfo({
    Key? key,
    required this.doctorData,
    required this.onCall,
    required this.onMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(doctorData.image),
          radius: 38.w,
        ),
        SizedBox(height: 16.w),
        Text(
          doctorData.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4.w),
        Text(
          doctorData.major,
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onCall,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.4),
                child: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 24.w),
            InkWell(
              onTap: onMessage,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.4),
                child: const Icon(
                  CupertinoIcons.chat_bubble_text_fill,
                  color: Colors.white,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}