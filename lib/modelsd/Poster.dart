import 'package:json_annotation/json_annotation.dart';
import 'ResizedImage.dart';

part 'Poster.g.dart';

@JsonSerializable()
class Poster {
      Poster();

  int id;
  String name;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  List<ResizedImage> images;

  factory Poster.fromJson(Map<String,dynamic> json) => _$PosterFromJson(json);
  Map<String, dynamic> toJson() => _$PosterToJson(this);
}
