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
        final Map<ResponseKey, dynamic> response = await myNetwork.post(
          event.url,
          event.object,
        );
        if (response[ResponseKey.type] == ResponseType.data) {
          yield FormSuccess(object: response[ResponseKey.data]);
        }
        if (response[ResponseKey.type] == ResponseType.invalidated) {
          yield FormInvalidated(errors: response[ResponseKey.error]);
        }
        log('successfully uploaded');
      } catch (error) {
        log(error.toString());
        yield FormFailure(error: error.toString());
      }
    }
  }
}
