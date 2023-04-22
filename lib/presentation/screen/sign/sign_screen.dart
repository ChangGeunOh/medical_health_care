import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/common/const/color.dart';
import 'package:medical_health_care/domain/model/account_data.dart';
import 'package:medical_health_care/presentation/component/custom_text_form_field.dart';
import 'package:medical_health_care/presentation/component/default_layout.dart';
import 'package:medical_health_care/presentation/screen/sign/bloc/sign_bloc.dart';
import 'package:medical_health_care/presentation/screen/sign/bloc/sign_event.dart';
import 'package:medical_health_care/presentation/screen/sign/bloc/sign_state.dart';

class SignScreen extends StatelessWidget {
  static String get routePath => '/sign';

  static String get routeName => 'sign';

  const SignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final passController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return DefaultLayout<SignBloc, SignState>(
      create: (context) {
        return SignBloc(context);
      },
      builder: (context, bloc, state) {
        return SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        bloc.add(SignEvent(SignEventType.login));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black54,
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            Image.asset('assets/images/doctors.png'),
                            SizedBox(height: 32.h),
                            CustomTextFormField(
                              prefixIconData: Icons.person,
                              hintText: 'Full Name',
                              controller: nameController,
                              validate: (value) {
                                if (value == null || value.isNotEmpty) {
                                  return null;
                                }
                                return '이름을 입력하세요.';
                              },
                            ),
                            SizedBox(height: 8.h),
                            CustomTextFormField(
                              prefixIconData: Icons.email,
                              hintText: 'Email Address',
                              controller: emailController,
                              validate: (value) {
                                if (value == null || value.isNotEmpty) {
                                  return null;
                                }
                                return '이메일을 입력하세요.';
                              },
                            ),
                            SizedBox(height: 8.h),
                            CustomTextFormField(
                              prefixIconData: Icons.phone,
                              hintText: 'Phone Number',
                              controller: phoneController,
                              validate: (value) {
                                if (value == null || value.isNotEmpty) {
                                  return null;
                                }
                                return '전화번호를 입력하세요.';
                              },
                            ),
                            SizedBox(height: 8.h),
                            CustomTextFormField(
                              isPassword: true,
                              prefixIconData: Icons.lock,
                              hintText: 'Email Password',
                              controller: passController,
                              validate: (value) {
                                if (value == null || value.isNotEmpty) {
                                  return null;
                                }
                                return '비밀번호를 입력하세요.';
                              },
                            ),
                            SizedBox(height: 8.h),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  final userData = AccountData(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    password: passController.text,
                                  );
                                  bloc.add(SignEvent(SignEventType.create, extra: userData));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor),
                              child: SizedBox(
                                height: 40.h,
                                child: Center(
                                  child: Text(
                                    'CREATE ACCOUNT',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Already have account?'),
                                SizedBox(width: 8.w),
                                TextButton(
                                  onPressed: () {
                                    bloc.add(SignEvent(SignEventType.login));
                                  },
                                  child: Text(
                                    'LOG IN',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -1.2,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

