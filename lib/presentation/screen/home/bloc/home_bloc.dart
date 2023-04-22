import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_care/data/repository/repository.dart';
import 'package:medical_health_care/domain/model/doctor_data.dart';
import 'package:medical_health_care/presentation/screen/book/book_screen.dart';
import 'package:medical_health_care/presentation/screen/home/bloc/home_event.dart';
import 'package:medical_health_care/presentation/screen/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuildContext _context;
  final Repository _repository;

  HomeBloc(BuildContext context)
      : _context = context,
        _repository = context.read<Repository>(),
        super(HomeState()) {
    on<HomeEvent>(_onHomeEvent);
    print('HomeBloc');
    add(HomeEvent(HomeEventType.init));
  }


  FutureOr<void> _onHomeEvent(HomeEvent event, Emitter<HomeState> emit) async {
    switch(event.type) {

      case HomeEventType.init:
        final popularDoctors = await _repository.getPopularDoctors();
        emit(state.copyWith(popularDoctors: popularDoctors));
        break;
      case HomeEventType.button:
        // TODO: Handle this case.
        break;
      case HomeEventType.book:
        final doctorData = event.extra as DoctorData;
        _context.pushNamed(BookScreen.routeName, extra: doctorData);
        break;
    }

  }
}
