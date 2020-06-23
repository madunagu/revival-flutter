import 'dart:async';
import 'dart:developer';

import 'package:devotion/events/FormEvent.dart';
import 'package:devotion/states/FormSheetState.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class FormBloc extends Bloc<FormEvent, FormSheetState> {
  final NetworkingClass myNetwork = NetworkingClass();

  FormSheetState get initialState => FormInitial();

  @override
  Stream<FormSheetState> mapEventToState(FormEvent event) async* {
    if (event is CreateButtonPressed) {
      yield FormInProgress();

      log('posting data object to $event.url');
      log(event.object.toString());
      try {
        final response = await myNetwork.post(
          event.url,
          event.object,
        );
        if (response.containsKey(ResponseType.data)) {
          yield FormSuccess(object: response[ResponseType.data]);
        }
        if (response.containsKey(ResponseType.invalidated)) {
          yield FormInvalidated(errors: response[ResponseType.invalidated]);
        }
        log('successfully uploaded');
      } catch (error) {
        log(error.toString());
        yield FormFailure(error: error.toString());
      }
    }
  }
}
