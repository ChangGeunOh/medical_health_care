import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({
    super.key,
    required this.about,
  });

  final String about;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Doctor',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.7,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          about,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 14.sp,
            letterSpacing: -0.7,
          ),
        ),
      ],
    );
  }
}