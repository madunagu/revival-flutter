import 'package:json_annotation/json_annotation.dart';
import 'Pagination.dart';

part 'ServerResponse.g.dart';

@JsonSerializable()
class ServerResponse {
      ServerResponse();

  List<dynamic> data;
  Pagination pagination;

  factory ServerResponse.fromJson(Map<String,dynamic> json) => _$ServerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ServerResponseToJson(this);
}
