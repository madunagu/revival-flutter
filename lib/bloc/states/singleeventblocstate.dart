import 'package:equatable/equatable.dart';

abstract class SingleEventBlocState extends Equatable {

  final List propss;
  SingleEventBlocState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnSingleEventBlocState extends SingleEventBlocState {

  UnSingleEventBlocState();

  @override
  String toString() => 'UnSingleEventBlocState';
}

/// Initialized
class InSingleEventBlocState extends SingleEventBlocState {
  final String hello;

  InSingleEventBlocState(this.hello) : super([hello]);

  @override
  String toString() => 'InSingleEventBlocState $hello';

}

class ErrorSingleEventBlocState extends SingleEventBlocState {
  final String errorMessage;

  ErrorSingleEventBlocState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorSingleEventBlocState';
}
