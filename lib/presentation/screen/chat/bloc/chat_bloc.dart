import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_care/domain/bloc/bloc_event.dart';
import 'package:medical_health_care/domain/bloc/custom_bloc.dart';
import 'package:medical_health_care/presentation/screen/chat/bloc/chat_event.dart';
import 'package:medical_health_care/presentation/screen/chat/bloc/chat_state.dart';

class ChatBloc extends CustomBloc<BlocEvent<ChatEventType>, ChatState> {
  ChatBloc(BuildContext context) : super(context, ChatState()) {
    add(BlocEvent(ChatEventType.init));
  }

  @override
  FutureOr<void> onBlocEvent(BlocEvent<ChatEventType> event, Emitter<ChatState> emit) async {

    switch (event.type) {
      case ChatEventType.init:
        final list = await repository.getChatList();
        emit(state.copyWith(chats: list));
        break;
    }
    throw UnimplementedError();
  }
}

/*

class ChatBloc extends Bloc<BlocEvent<ChatEventType>, ChatState> {
  final BuildContext _context;
  final Repository _repository;

  ChatBloc(BuildContext context)
      : _context = context,
        _repository = context.read<Repository>(),
        super(ChatState()) {
    on<BlocEvent<ChatEventType>>(_onChatEvent);
  }

  FutureOr<void> _onChatEvent(
      BlocEvent<ChatEventType> event, Emitter<ChatState> emit) {
    switch (event.type) {
      case ChatEventType.init:
        // TODO: Handle this case.
        break;
    }
  }
}


 */
