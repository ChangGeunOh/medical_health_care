import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_care/data/repository/repository.dart';
import 'package:medical_health_care/presentation/screen/chat/chat_screen.dart';
import 'package:medical_health_care/presentation/screen/message/bloc/message_event.dart';
import 'package:medical_health_care/presentation/screen/message/bloc/message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final BuildContext _context;
  final Repository _repository;

  MessageBloc(BuildContext context)
      : _context = context,
        _repository = context.read<Repository>(),
        super(MessageState()) {
    on<MessageEvent>(_onEvent);

    add(MessageEvent(MessageEventType.init));
  }

  FutureOr<void> _onEvent(MessageEvent event, Emitter<MessageState> emit) async {
    switch (event.type) {
      case MessageEventType.init:
        final activeActors = await _repository.getActiveDoctors();
        final recentChats = await _repository.getRecentChats();
        emit(state.copyWith(activeDoctors: activeActors, recentChats: recentChats));
        break;
      case MessageEventType.search:
        // TODO: Handle this case.
        break;
      case MessageEventType.chat:
        _context.pushNamed(ChatScreen.routeName);
        break;
    }
  }
}
