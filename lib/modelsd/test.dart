import 'package:json_annotation/json_annotation.dart';


part 'test.g.dart';

@JsonSerializable()
class Test {
      Test();

  List<dynamic> data;
  Pagination pagination;

  factory Test.fromJson(Map<String,dynamic> json) => _$TestFromJson(json);
  Map<String, dynamic> toJson() => _$TestToJson(this);
}

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
