import 'package:json_annotation/json_annotation.dart';


part 'Feed.g.dart';

@JsonSerializable()
class Feed {
      Feed();

  int id;
  @JsonKey(name: 'user_id') int userId;
  @JsonKey(name: 'follower_id') int followerId;
  @JsonKey(name: 'created_at') String createdAt;
  @JsonKey(name: 'updated_at') String updatedAt;
  String type;
  @JsonKey(name: 'item_id') int itemId;
  String poster;
  @JsonKey(name: 'poster_id') int posterId;
  String name;
  @JsonKey(name: 'church_id') int churchId;
  @JsonKey(name: 'starting_at') String startingAt;
  @JsonKey(name: 'ending_at') String endingAt;
  @JsonKey(name: 'address_id') int addressId;
  @JsonKey(name: 'hierarchy_group_id') int hierarchyGroupId;
  @JsonKey(name: 'profile_media_id') int profileMediaId;
  @JsonKey(name: 'deleted_at') dynamic deletedAt;

  factory Feed.fromJson(Map<String,dynamic> json) => _$FeedFromJson(json);
  Map<String, dynamic> toJson() => _$FeedToJson(this);
}
