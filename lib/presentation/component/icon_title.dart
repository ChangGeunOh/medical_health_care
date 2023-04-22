import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTitle extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String text;

  const IconTitle({
    Key? key,
    required this.iconData,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: iconColor,
          size: 18,
        ),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(
            color: Colors.black38,
            fontSize: 11.sp,
          ),
        ),
      ],
    );
  }
}