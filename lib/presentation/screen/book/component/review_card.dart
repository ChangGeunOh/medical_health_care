import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/domain/model/doctor_data.dart';


class ReviewCard extends StatelessWidget {
  final DoctorData doctorData;

  const ReviewCard({
    Key? key,
    required this.doctorData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      width: 250.w,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(doctorData.image),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorData.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.7,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '1 day ago',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(
                doctorData.rate.toString(),
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Many thanks to Dr. Dear. He is a great and professional doctor',
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 12.sp
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}