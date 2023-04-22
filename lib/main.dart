import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_care/common/const/network.dart';
import 'package:medical_health_care/data/network/local_network.dart';
import 'package:medical_health_care/data/repository/database_source_impl.dart';
import 'package:medical_health_care/data/repository/datastore_source_impl.dart';
import 'package:medical_health_care/data/repository/network_source_impl.dart';
import 'package:medical_health_care/data/repository/repository.dart';
import 'package:medical_health_care/domain/model/doctor_data.dart';
import 'package:medical_health_care/presentation/screen/about/about_screen.dart';
import 'package:medical_health_care/presentation/screen/book/book_screen.dart';
import 'package:medical_health_care/presentation/screen/chat/chat_screen.dart';
import 'package:medical_health_care/presentation/screen/login/login_screen.dart';
import 'package:medical_health_care/presentation/screen/main/main_screen.dart';
import 'package:medical_health_care/presentation/screen/sign/sign_screen.dart';
import 'package:medical_health_care/presentation/screen/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      lazy: false,
      create: (context) {
        final databaseSource = DatabaseSourceImpl();
        final dataStoreSource = DataStoreSourceImpl();
        final networkSource = NetworkSourceImpl(
          LocalNetwork.dio,
          baseUrl: kBaseUrl,
        );
        return Repository(
          databaseSource: databaseSource,
          dataStoreSource: dataStoreSource,
          networkSource: networkSource,
        );
      },
      child: ScreenUtilInit(builder: (context, child) {
        return MaterialApp.router(
          title: 'Medical Health Care',
          theme: ThemeData(primarySwatch: Colors.purple),
          debugShowCheckedModeBanner: false,
          routerConfig: GoRouter(
            initialLocation: SplashScreen.routePath,
            routes: [
              GoRoute(
                path: MainScreen.routePath,
                name: MainScreen.routeName,
                builder: (_, __) => const MainScreen(),
              ),
              GoRoute(
                path: SplashScreen.routePath,
                name: SplashScreen.routeName,
                builder: (_, __) => const SplashScreen(),
              ),
              GoRoute(
                path: LoginScreen.routePath,
                name: LoginScreen.routeName,
                builder: (_, __) => const LoginScreen(),
              ),
              GoRoute(
                path: SignScreen.routePath,
                name: SignScreen.routeName,
                builder: (_, __) => const SignScreen(),
              ),
              GoRoute(
                path: BookScreen.routePath,
                name: BookScreen.routeName,
                builder: (context, state) {
                  // final doctorData = state.extra as DoctorData;
                  final doctorData = DoctorData(
                    name: 'Dr. Doctor Name',
                    major: 'Therapist',
                    rate: 4.9,
                    image: 'assets/images/doctor2.jpg',
                    description:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  );
                  return BookScreen(doctorData: doctorData);
                },
              ),
              GoRoute(
                path: ChatScreen.routePath,
                name: ChatScreen.routeName,
                builder: (_, __) => const ChatScreen(),
              ),
              GoRoute(
                path: AboutScreen.routePath,
                name: AboutScreen.routeName,
                builder: (_, __) => const AboutScreen(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
