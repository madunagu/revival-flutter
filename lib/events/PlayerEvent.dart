import 'package:equatable/equatable.dart';

abstract class PlayerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PlayerFetched extends PlayerEvent {}
class PlayerPaused extends PlayerEvent {}
class PlayerTouched extends PlayerEvent {}
class PlayerMoved extends PlayerEvent {}
class PlayerSkipped extends PlayerEvent {}
class PlayerSwitched extends PlayerEvent {}
class PlayerLiked extends PlayerEvent{}


  