
import 'package:devotion/bloc/blocs/form.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetWidget extends StatelessWidget {
  final Widget child;
  BottomSheetWidget({this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return FormBloc();
        },
        child: Container(
          child: child,
        ),
      ),
    );
  }
}
