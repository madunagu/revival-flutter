// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Paginated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paginated _$PaginatedFromJson(Map<String, dynamic> json) {
  return Paginated()
    ..data = json['data'] as List
    ..pagination = json['pagination'] == null
        ? null
        : Pagination.fromJson(json['pagination'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PaginatedToJson(Paginated instance) => <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };
