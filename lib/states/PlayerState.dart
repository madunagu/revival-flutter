import 'package:devotion/models/Event.dart';
import 'package:devotion/models/Feed.dart';
import 'package:equatable/equatable.dart';

abstract class PlayerState extends Equatable {
  const PlayerState();

  @override
  List<Object> get props => [];
}

class PlayerInitial extends PlayerState {}
class PlayerLoading extends PlayerState {}
class PlayerLoaded extends PlayerState {}
class PlayerAttentive extends PlayerLoaded {}
class PlayerPlaying extends PlayerLoaded {}
class PlayerPaused extends PlayerLoaded {}


class PlayerFailed extends PlayerState {}


