import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();
}

class CreateButtonPressed extends FormEvent {
  final dynamic object;
  final String url;

  const CreateButtonPressed({
    @required this.object,
    @required this.url,
  });

  @override
  List<Object> get props => [object,url];

  @override
  String toString() => 'Create Button Pressed Event';
}
