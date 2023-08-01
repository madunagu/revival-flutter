import 'package:json_annotation/json_annotation.dart';


part 'ServerResponse.g.dart';

@JsonSerializable()
class ServerResponse {
      ServerResponse();

  List<dynamic> data;
  int total;
  int count;
  @JsonKey(name: 'per_page') int perPage;
  @JsonKey(name: 'current_page') int currentPage;
  @JsonKey(name: 'total_pages') int totalPages;

  factory ServerResponse.fromJson(Map<String,dynamic> json) => _$ServerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ServerResponseToJson(this);
}
