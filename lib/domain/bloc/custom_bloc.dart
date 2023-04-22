import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_care/data/repository/repository.dart';

abstract class CustomBloc<Event, State> extends Bloc<Event, State> {
  final BuildContext context;
  final Repository repository;

  CustomBloc(this.context, State initialState)
      : repository = context.read<Repository>(),
        super(initialState) {
    on<Event>(onBlocEvent);
  }

  FutureOr<void> onBlocEvent(Event event, Emitter<State> emit);
}