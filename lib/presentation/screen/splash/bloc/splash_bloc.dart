import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_care/data/repository/repository.dart';
import 'package:medical_health_care/presentation/screen/login/login_screen.dart';
import 'package:medical_health_care/presentation/screen/main/main_screen.dart';
import 'package:medical_health_care/presentation/screen/sign/sign_screen.dart';
import 'package:medical_health_care/presentation/screen/splash/bloc/splash_event.dart';
import 'package:medical_health_care/presentation/screen/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Repository _repository;
  final BuildContext _context;

  SplashBloc(BuildContext context)
      : _context = context,
        _repository = context.read<Repository>(),
        super(SplashState()) {
    on<SplashEvent>((event, emit) {
      switch (event.type) {
        case SplashEventType.login:
          _context.pushNamed(LoginScreen.routeName);
          break;
        case SplashEventType.signup:
          _context.pushNamed(SignScreen.routeName);
          break;
        case SplashEventType.skip:
          _context.goNamed(MainScreen.routeName);
          break;
      }
    });
  }
}
