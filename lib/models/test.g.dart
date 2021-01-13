// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Test _$TestFromJson(Map<String, dynamic> json) {
  return Test()
    ..data = json['data'] as List
    ..pagination = json['pagination'] == null
        ? null
        : Pagination.fromJson(json['pagination'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TestToJson(Test instance) => <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return Pagination()
    ..total = json['total'] as int
    ..count = json['count'] as int
    ..perPage = json['per_page'] as int
    ..currentPage = json['current_page'] as int
    ..totalPages = json['total_pages'] as int;
}

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'total': instance.total,
      'count': instance.count,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
    };
