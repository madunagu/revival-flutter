import 'package:json_annotation/json_annotation.dart';
import 'Poster.dart';
import 'User.dart';
import 'ResizedImage.dart';

part 'Devotional.g.dart';

@JsonSerializable()
class Devotional {
      Devotional();

  int id;
  @JsonKey(name: 'user_id') int userId;
  String title;
  @JsonKey(name: 'opening_prayer') String openingPrayer;
  @JsonKey(name: 'closing_prayer') String closingPrayer;
  @JsonKey(name: 'memory_verse') String memoryVerse;
  String body;
  @JsonKey(name: 'poster_type') String posterType;
  Poster poster;
  DateTime day;
  int devoted;
  @JsonKey(name: 'devotees_count') int devoteesCount;
  List<User> devotees;
  List<ResizedImage> images;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;

  factory Devotional.fromJson(Map<String,dynamic> json) => _$DevotionalFromJson(json);
  Map<String, dynamic> toJson() => _$DevotionalToJson(this);
}
