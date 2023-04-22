import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;

  const CustomSliverAppBar({
    required this.title,
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 26.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: -0.7,
        ),
      ),
    );
  }
}