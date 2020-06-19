import 'dart:async';

import 'package:devotion/events/FormEvent.dart';
import 'package:devotion/states/FormState.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  final NetworkingClass myNetwork = NetworkingClass();

  FormState get initialState => FormInitial();

  @override
  Stream<FormState> mapEventToState(FormEvent event) async* {
    if (event is CreateButtonPressed) {
      yield FormInProgress();

      try {
        final response = await myNetwork.post(
          event.url,
          event.object,
        );

        yield FormSuccess(object: response);
      } catch (error) {
        yield FormFailure(error: error.toString());
      }
    }
  }
}
