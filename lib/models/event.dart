import 'package:json_annotation/json_annotation.dart';
import 'Comment.dart';
import 'User.dart';
import 'Church.dart';
import 'Address.dart';
import 'User.dart';
import 'ProfileMedia.dart';

part 'Event.g.dart';

@JsonSerializable()
class Event {
      Event();

  int id;
  String name;
  String description;
  @JsonKey(name: 'starting_at') DateTime startingAt;
  @JsonKey(name: 'ending_at') DateTime endingAt;
  @JsonKey(name: 'user_id') int userId;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  @JsonKey(name: 'comments_count') int commentsCount;
  @JsonKey(name: 'attendees_count') int attendeesCount;
  int attending;
  @JsonKey(name: 'views_count') int viewsCount;
  int viewed;
  List<Comment> comments;
  User user;
  List<Church> churches;
  List<Address> addresses;
  List<User> attendees;
  @JsonKey(name: 'profile_media') List<ProfileMedia> profileMedia;

  factory Event.fromJson(Map<String,dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
