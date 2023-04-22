import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_care/data/repository/repository.dart';
import 'package:medical_health_care/presentation/screen/login/login_screen.dart';
import 'package:medical_health_care/presentation/screen/sign/bloc/sign_event.dart';
import 'package:medical_health_care/presentation/screen/sign/bloc/sign_state.dart';
import 'package:medical_health_care/presentation/screen/sign/sign_screen.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final Repository _repository;
  final BuildContext _context;

  SignBloc(BuildContext context)
      : _context = context,
        _repository = context.read<Repository>(),
        super(SignState()) {
    on<SignEvent>(
      (event, emit) {
        switch (event.type) {
          case SignEventType.create:
            _context.pushNamed(SignScreen.routeName);
            break;
          case SignEventType.login:
            _context.pushNamed(LoginScreen.routeName);
            print('login');
            _context.pop();
            break;
        }
      },
    );
  }
}
