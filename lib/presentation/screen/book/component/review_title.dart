import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/domain/model/doctor_data.dart';

class ReviewsTitle extends StatelessWidget {
  final DoctorData doctorData;

  const ReviewsTitle({
    Key? key,
    required this.doctorData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reviews',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8.w),
            const Icon(Icons.star, color: Colors.yellow),
            SizedBox(width: 2.w),
            Text(
              doctorData.rate.toString(),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              '(124)',
              style: TextStyle(fontSize: 14.sp, color: Colors.black45),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'See all',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}