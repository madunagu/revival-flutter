import 'package:json_annotation/json_annotation.dart';


part 'Feed.g.dart';

@JsonSerializable()
class Feed {
      Feed();

  int id;
  @JsonKey(name: 'created_at') String createdAt;
  @JsonKey(name: 'updated_at') String updatedAt;
  @JsonKey(name: 'parentable_type') String parentableType;
  @JsonKey(name: 'parentable_id') int parentableId;
  @JsonKey(name: 'postable_type') String postableType;
  @JsonKey(name: 'postable_id') int postableId;
  String parentable;
  @JsonKey(name: 'deleted_at') dynamic deletedAt;

  factory Feed.fromJson(Map<String,dynamic> json) => _$FeedFromJson(json);
  Map<String, dynamic> toJson() => _$FeedToJson(this);
}
