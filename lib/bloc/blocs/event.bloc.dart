import 'package:bloc/bloc.dart';
import 'dart:async';

enum EventEvent {
  list,
  select,

}

class EventBloc extends Bloc<EventEvent, dynamic> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(EventEvent event) async* {
    switch (event) {
      case EventEvent.select:
        yield state - 1;
        break;
      case EventEvent.list:
        yield state + 1;
        break;
    }
  }
}
