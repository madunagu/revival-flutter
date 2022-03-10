import 'dart:async';
import 'dart:developer';

import 'package:devotion/bloc/events/index.dart';
import 'package:devotion/bloc/states/FormSheetState.dart';
import 'package:devotion/util/Exceptions.dart';
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
      // log(event.object.toString());
      try {
        final Map<String, dynamic> response = await myNetwork.post(
          event.url,
          event.object,
        );
        yield FormSuccess(object: response);
        log('successfully uploaded');
      } catch (error) {
        log(error.toString());
        if (error is ValidationErrorException) {
          yield FormInvalidated(errors: error.errors);
        }
      }
    }
  }
}
