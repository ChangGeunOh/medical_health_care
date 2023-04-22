import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_care/data/repository/repository.dart';
import 'package:medical_health_care/presentation/screen/schedule/bloc/schedule_event.dart';
import 'package:medical_health_care/presentation/screen/schedule/bloc/schedule_state.dart';
import 'package:medical_health_care/presentation/screen/schedule/component/schedule_segment.dart';
import 'package:medical_health_care/presentation/screen/schedule/schedule_screen.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final Repository _repository;
  final BuildContext _context;

  ScheduleBloc(BuildContext context)
      : _context = context,
        _repository = context.read<Repository>(),
        super(ScheduleState()) {
    on<ScheduleEvent>(_onEvent);
    add(ScheduleEvent(ScheduleEventType.init));
  }

  FutureOr<void> _onEvent(
      ScheduleEvent event, Emitter<ScheduleState> emit) async {
    switch (event.type) {
      case ScheduleEventType.init:
        final schedules = await _repository.getSchedules(ScheduleType.upcoming);
        emit(state.copyWith(schedules: schedules));
        break;
      case ScheduleEventType.scheduleType:
        final scheduleType = event.extra as ScheduleType;
        final schedules = await _repository.getSchedules(scheduleType);
        emit(state.copyWith(scheduleType: scheduleType, schedules: schedules));
        break;
    }
  }

}
