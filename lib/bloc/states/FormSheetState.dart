import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class FormSheetState extends Equatable {
  const FormSheetState();

  @override
  List<Object> get props => [];
}

class FormInitial extends FormSheetState {}

class FormInProgress extends FormSheetState {}

class FormSuccess extends FormSheetState {
  final dynamic object;

  const FormSuccess({this.object});
}

class FormInvalidated extends FormSheetState {
  final Map<String,dynamic> errors;

  const FormInvalidated({required this.errors});

  @override
  List<Object> get props => [errors];

  @override
  String toString() => 'FormInvalidated { errors: $errors }';
}

class FormFailure extends FormSheetState {
  final String error;

  const FormFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'FormFailure { error: $error }';
}
