import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveNowCard extends StatelessWidget {
  final VoidCallback onClick;
  final String image;

  const ActiveNowCard({
    Key? key,
    required this.image,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      width: 65.w,
      height: 65.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        textDirection: TextDirection.rtl,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 35,
            ),
          ),
          Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.fiber_manual_record,
                color: Colors.green,
              ))
        ],
      ),
    );
  }
}