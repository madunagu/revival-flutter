import 'package:json_annotation/json_annotation.dart';
import 'Church.dart';

part 'Event.g.dart';

@JsonSerializable()
class Event {
  Event();

  int id;
  String name;
  @JsonKey(name: 'church_id')
  int churchId;
  @JsonKey(name: 'starting_at')
  String startingAt;
  @JsonKey(name: 'ending_at')
  String endingAt;
  @JsonKey(name: 'address_id')
  int addressId;
  @JsonKey(name: 'heirachy_group_id')
  int heirachyGroupId;
  @JsonKey(name: 'profile_media_id')
  int profileMediaId;
  @JsonKey(name: 'user_id')
  int userId;
  @JsonKey(name: 'deleted_at')
  DateTime deletedAt;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'updated_at')
  DateTime updatedAt;
  Church church;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
