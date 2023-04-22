import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/common/const/color.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.location_on,
                  color: primaryColor,
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New York, Medical Center',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.6),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'address line of the medical center.',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}