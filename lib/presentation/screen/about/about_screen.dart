import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/common/const/color.dart';

class AboutScreen extends StatelessWidget {
  static String get routePath => '/about';

  static String get routeName => 'about';

  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black87,
        // iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text('About Me'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Image.asset('assets/images/profile.png'),
            ),
            const SizedBox(height: 16),
            Text(
              'ChangGeun Oh',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: -0.6,
                color: Colors.black87,
                fontSize: 24.sp,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '(Frontend Developer)',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: -0.6,
                color: Colors.black38,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
