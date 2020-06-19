import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class FormState extends Equatable {
  const FormState();

  @override
  List<Object> get props => [];
}

class FormInitial extends FormState {}

class FormInProgress extends FormState {}

class FormSuccess extends FormState {
  final dynamic object;

  const FormSuccess({this.object});
}

class FormFailure extends FormState {
  final String error;

  const FormFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'FormFailure { error: $error }';
}
