import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();
  @override
  List<Object> get props => [];
}

enum PlayedType { audio, video }

class PlayerFetched extends PlayerEvent {
  final int id;
  final PlayedType playedType;

  const PlayerFetched({@required this.id, @required this.playedType});

  @override
  List<Object> get props => [id, playedType];

  @override
  String toString() => 'PlayerFetched { id: $id }';
}

class PlayerPaused extends PlayerEvent {}

class PlayerDocked extends PlayerEvent {
  final double height;
    const PlayerDocked({ @required this.height});

  @override
  List<Object> get props => [height];

  @override
  String toString() => 'PlayerDocked { height: $height }';
}

class PlayerTouched extends PlayerEvent {}

class PlayerMoved extends PlayerEvent {}

class PlayerSkipped extends PlayerEvent {}

class PlayerSwitched extends PlayerEvent {}

class PlayerLiked extends PlayerEvent {}
