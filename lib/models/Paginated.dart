import 'package:json_annotation/json_annotation.dart';
import 'Event.dart';
import 'Pagination.dart';

part 'Paginated.g.dart';

@JsonSerializable()
class Paginated {
      Paginated();

  List<Event> data;
  Pagination pagination;

  factory Paginated.fromJson(Map<String,dynamic> json) => _$PaginatedFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedToJson(this);
}
