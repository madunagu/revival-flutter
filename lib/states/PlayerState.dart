import 'package:devotion/models/Event.dart';
import 'package:devotion/models/Feed.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PlayerState extends Equatable {
  const PlayerState();

  @override
  List<Object> get props => [];
}

class PlayerInitial extends PlayerState {}

class PlayerLoading extends PlayerState {}

class PlayerLoaded extends PlayerState {
  final playable;

  const PlayerLoaded({@required this.playable});

  @override
  List<Object> get props => [playable];

  @override
  String toString() => 'PlayerLoaded { playable: $playable }';
}

class PlayerAttentive extends PlayerLoaded {}

class PlayerPlaying extends PlayerLoaded {}

class PlayerPaused extends PlayerLoaded {}

class PlayerFailure extends PlayerState {
  final String error;

  const PlayerFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'PlayerFailure { error: $error }';
}
