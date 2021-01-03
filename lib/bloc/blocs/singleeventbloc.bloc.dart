import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:devotion/bloc/events/singleeventblocevent.dart';
import 'package:devotion/bloc/states/singleeventblocstate.dart';

class SingleEventBloc extends Bloc<SingleEventBlocEvent, SingleEventBlocState> {

  @override
  SingleEventBlocState get initialState => UnSingleEventBlocState();

  @override
  Stream<SingleEventBlocState> mapEventToState(
    SingleEventBlocEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'SingleEventBlocBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
