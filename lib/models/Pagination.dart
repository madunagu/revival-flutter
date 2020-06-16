import 'package:json_annotation/json_annotation.dart';


part 'Pagination.g.dart';

@JsonSerializable()
class Pagination {
      Pagination();

  int total;
  int count;
  @JsonKey(name: 'per_page') int perPage;
  @JsonKey(name: 'current_page') int currentPage;
  @JsonKey(name: 'total_pages') int totalPages;

  factory Pagination.fromJson(Map<String,dynamic> json) => _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
