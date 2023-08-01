import 'dart:async';
import 'dart:developer' as developer;

import 'package:devotion/bloc/blocs/singleeventbloc.bloc.dart';
import 'package:devotion/bloc/states/singleeventblocstate.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SingleEventBlocEvent {
  Stream<SingleEventBlocState> applyAsync(
      {SingleEventBlocState currentState, SingleEventBloc bloc});
}

class UnSingleEventBlocEvent extends SingleEventBlocEvent {
  @override
  Stream<SingleEventBlocState> applyAsync({SingleEventBlocState? currentState, SingleEventBloc? bloc}) async* {
    yield UnSingleEventBlocState();
  }
}

class LoadSingleEventBlocEvent extends SingleEventBlocEvent {
   
  @override
  Stream<SingleEventBlocState> applyAsync(
      {SingleEventBlocState? currentState, SingleEventBloc? bloc}) async* {
    try {
      yield UnSingleEventBlocState();
      await Future.delayed(Duration(seconds: 1));
      yield InSingleEventBlocState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadSingleEventBlocEvent', error: _, stackTrace: stackTrace);
      yield ErrorSingleEventBlocState( _.toString());
    }
  }
}
