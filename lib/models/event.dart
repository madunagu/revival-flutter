import 'package:devotion/models/Address.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'Church.dart';

part 'Event.g.dart';

@JsonSerializable()
class Event extends Equatable{
      Event();

  int id;
  String name;
  @JsonKey(name: 'church_id') int churchId;
  @JsonKey(name: 'starting_at') DateTime startingAt;
  @JsonKey(name: 'ending_at') DateTime endingAt;
  @JsonKey(name: 'address_id') int addressId;
  @JsonKey(name: 'heirachy_group_id') int heirachyGroupId;
  @JsonKey(name: 'profile_media_id') int profileMediaId;
  @JsonKey(name: 'user_id') int userId;
  @JsonKey(name: 'deleted_at') DateTime deletedAt;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  Church church;
  Address address;

  factory Event.fromJson(Map<String,dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);

  @override
  List<Object> get props => [id, name, startingAt, userId, createdAt, addressId, heirachyGroupId];

  @override
  String toString() => 'Post { id: $id }';
}
