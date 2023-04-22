import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/common/const/color.dart';

class BookBottom extends StatelessWidget {
  final VoidCallback onClick;
  final double price;

  const BookBottom({
    super.key,
    required this.price,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Consultation Price',
                style: TextStyle(color: Colors.black54, fontSize: 14.sp),
              ),
              const Spacer(),
              Text(
                '\$$price',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.7,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: onClick,
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            child: SizedBox(
              height: 40.h,
              child: Center(
                child: Text(
                  'BOOK APPOINTMENT',
                  style: TextStyle(
                    fontSize: 16.sp,
                    letterSpacing: -0.7,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}