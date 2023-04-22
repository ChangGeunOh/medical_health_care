import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/common/const/color.dart';
import 'package:medical_health_care/data/repository/repository.dart';
import 'package:medical_health_care/presentation/screen/splash/bloc/splash_bloc.dart';
import 'package:medical_health_care/presentation/screen/splash/bloc/splash_event.dart';
import 'package:medical_health_care/presentation/screen/splash/bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  static String get routePath => '/splash';

  static String get routeName => 'splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {

          return SplashBloc(context);
        },
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            context.read<SplashBloc>().add(
                                  SplashEvent(type: SplashEventType.skip),
                                );
                          },
                          child: Text(
                            'SKIP',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 52.h),
                    Image.asset('assets/images/doctors.png'),
                    SizedBox(height: 38.h),
                    Text(
                      'Doctors Appointment',
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 26.sp),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Appoint Your Doctor',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 64.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<SplashBloc>().add(
                                  SplashEvent(type: SplashEventType.login),
                                );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor),
                          child: SizedBox(
                            width: 80.w,
                            height: 40.h,
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 24.h),
                        ElevatedButton(
                          onPressed: () {
                            context.read<SplashBloc>().add(
                                  SplashEvent(type: SplashEventType.signup),
                                );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor),
                          child: SizedBox(
                            width: 80.w,
                            height: 40.h,
                            child: Center(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
