import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_care/domain/bloc/bloc_event.dart';
import 'package:medical_health_care/domain/bloc/custom_bloc.dart';
import 'package:medical_health_care/presentation/screen/about/about_screen.dart';
import 'package:medical_health_care/presentation/screen/setting/bloc/setting_event.dart';
import 'package:medical_health_care/presentation/screen/setting/bloc/setting_state.dart';

class SettingBloc extends CustomBloc<BlocEvent<SettingEventType>, SettingState>{
  SettingBloc(super.context, super.initialState);

  @override
  FutureOr<void> onBlocEvent(BlocEvent<SettingEventType> event, Emitter<SettingState> emit) {
    switch(event.type) {

      case SettingEventType.init:
        // TODO: Handle this case.
        break;
      case SettingEventType.route:
        // TODO: Handle this case.
        break;
      case SettingEventType.aboutUs:
        context.pushNamed(AboutScreen.routeName);
        break;
    }
  }

}