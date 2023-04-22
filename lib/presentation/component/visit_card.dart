import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/common/const/color.dart';

class VisitCard extends StatelessWidget {
  final String title, description;
  final IconData iconData;
  final bool isAddVisit;
  final VoidCallback onClick;

  const VisitCard({
    required this.title,
    required this.description,
    required this.iconData,
    required this.onClick,
    bool? isAddVisit,
    super.key,
  }) : isAddVisit = isAddVisit ?? false;

  @override
  Widget build(BuildContext context) {
    late Color background, titleColor, iconBackground, descriptionColor;
    if (isAddVisit) {
      background = primaryColor;
      titleColor = Colors.white;
      iconBackground = Colors.white;
      descriptionColor = Colors.white70;
    } else {
      background = Colors.white;
      titleColor = Colors.black87;
      iconBackground = Colors.black12;
      descriptionColor = Colors.black54;
    }

    return Card(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
            )
          ],
          color: background,
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        width: 155.w,
        height: 140.h,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconBackground,
                ),
                child: IconButton(
                  onPressed: onClick,
                  icon: Icon(
                    iconData,
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: descriptionColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}