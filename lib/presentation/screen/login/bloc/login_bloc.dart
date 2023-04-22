import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_care/data/repository/repository.dart';
import 'package:medical_health_care/domain/model/login_data.dart';
import 'package:medical_health_care/domain/model/user_data.dart';
import 'package:medical_health_care/presentation/screen/login/bloc/login_event.dart';
import 'package:medical_health_care/presentation/screen/login/bloc/login_state.dart';
import 'package:medical_health_care/presentation/screen/main/main_screen.dart';
import 'package:medical_health_care/presentation/screen/sign/sign_screen.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Repository _repository;
  final BuildContext _context;

  LoginBloc(BuildContext context)
      : _context = context,
        _repository = context.read<Repository>(),
        super(LoginState()) {
    on<LoginEvent>(_onLoginEvent);
  }

  void _onLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    switch (event.type) {
      case LoginEventType.login:
        await _onLogin(emit, event);
        break;
      case LoginEventType.password:
        emit(state.copyWith(
          isShowPassword: !state.isShowPassword,
        ));
        break;
      case LoginEventType.create:
        _context.pushNamed(SignScreen.routeName);
        break;
      case LoginEventType.cancel:
        emit(state.copyWith(loadingState: LoadingState.none));
        break;
    }
  }

  Future<void> _onLogin(Emitter<LoginState> emit, LoginEvent event) async {
    emit(state.copyWith(loadingState: LoadingState.loading));
    final loginData = event.extra as LoginData;
    final userData = await _repository.login(
      userid: loginData.username,
      passwd: loginData.password,
    );
    emit(state.copyWith(loadingState: LoadingState.cancel, isAuthed: true));
  }

}
