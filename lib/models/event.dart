import 'package:json_annotation/json_annotation.dart';
import 'User.dart';
import 'Poster.dart';
import 'Comment.dart';
import 'Church.dart';
import 'Address.dart';
import 'User.dart';
import 'ResizedImage.dart';

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
  @JsonKey(name: 'address_id') int addressId;
  User user;
  @JsonKey(name: 'poster_type') String posterType;
  Poster poster;
  List<Comment> comments;
  List<Church> churches;
  List<Address> addresses;
  List<User> attendees;
  List<ResizedImage> images;

  factory Event.fromJson(Map<String,dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
