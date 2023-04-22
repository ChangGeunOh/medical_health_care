import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_care/data/repository/repository.dart';
import 'package:medical_health_care/presentation/screen/book/bloc/book_event.dart';
import 'package:medical_health_care/presentation/screen/book/bloc/book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final Repository _repository;

  BookBloc(Repository repository)
      : _repository = repository,
        super(BookState()) {
    on<BookEvent>(_onBookEvent);
  }

  FutureOr<void> _onBookEvent(BookEvent event, Emitter<BookState> emit) async {
    switch(event.type) {

      case BookEventType.init:

        break;
    }
  }
}
