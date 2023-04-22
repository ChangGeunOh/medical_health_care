import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_care/common/const/color.dart';
import 'package:medical_health_care/domain/model/login_data.dart';
import 'package:medical_health_care/presentation/component/custom_text_form_field.dart';
import 'package:medical_health_care/presentation/component/default_layout.dart';
import 'package:medical_health_care/presentation/screen/login/bloc/login_bloc.dart';
import 'package:medical_health_care/presentation/screen/login/bloc/login_event.dart';
import 'package:medical_health_care/presentation/screen/login/bloc/login_state.dart';
import 'package:medical_health_care/presentation/screen/main/main_screen.dart';

class LoginScreen extends StatelessWidget {
  static String get routePath => '/login';

  static String get routeName => 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return DefaultLayout<LoginBloc, LoginState>(
      create: (context) => LoginBloc(context),
      builder: (context, bloc, state) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            if (state.loadingState == LoadingState.loading) {
              showDialog(
                context: context,
                builder: (context) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: SizedBox(
                        height: 50.0,
                        width: 50.0,
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                            strokeWidth: 5.0),
                      ),
                    ),
                  );
                },
              );
            } else if (state.loadingState == LoadingState.cancel) {
              if (context.canPop()) {
                context.pop();
              }
              bloc.add(LoginEvent(LoginEventType.cancel));
            } else if (state.isAuthed) {
              context.goNamed(MainScreen.routeName);
            }
          },
        );

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24.h),
                Image.asset('assets/images/doctors.png'),
                SizedBox(height: 38.h),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        prefixIconData: Icons.person,
                        hintText: 'Enter Username',
                        controller: usernameController,
                        validate: (value) {
                          if (value == null || value.isNotEmpty) {
                            return null;
                          }
                          return '사용자 계정을 입력하세요.';
                        },
                      ),
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        controller: passwordController,
                        isPassword: true,
                        hintText: 'Enter Password',
                        prefixIconData: Icons.lock,
                        validate: (value) {
                          if (value == null || value.isNotEmpty) {
                            return null;
                          }
                          return '비밀번호를 입력하세요.';
                        },
                      ),
                      SizedBox(height: 32.h),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final loginData = LoginData(
                              username: usernameController.text,
                              password: passwordController.text,
                            );
                            print(loginData.toString());
                            bloc.add(LoginEvent(LoginEventType.login,
                                extra: loginData));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor),
                        child: SizedBox(
                          height: 40.h,
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have any account?'),
                    SizedBox(width: 4.w),
                    TextButton(
                      onPressed: () {
                        bloc.add(LoginEvent(LoginEventType.create));
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
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
    );
  }
}
