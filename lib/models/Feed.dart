import 'package:json_annotation/json_annotation.dart';


part 'Feed.g.dart';

@JsonSerializable()
class Feed {
      Feed();

  int id;
  @JsonKey(name: 'parentable_type') String parentableType;
  @JsonKey(name: 'postable_type') String postableType;
  @JsonKey(name: 'postable_id') int postableId;
  @JsonKey(name: 'parentable_id') int parentableId;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  @JsonKey(ignore: true) dynamic parentable;

  factory Feed.fromJson(Map<String,dynamic> json) => _$FeedFromJson(json);
  Map<String, dynamic> toJson() => _$FeedToJson(this);
}
