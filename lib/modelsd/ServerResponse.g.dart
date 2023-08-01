// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServerResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerResponse _$ServerResponseFromJson(Map<String, dynamic> json) {
  return ServerResponse()
    ..data = json['data'] as List
    ..total = json['total'] as int
    ..count = json['count'] as int
    ..perPage = json['per_page'] as int
    ..currentPage = json['current_page'] as int
    ..totalPages = json['total_pages'] as int;
}

Map<String, dynamic> _$ServerResponseToJson(ServerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'count': instance.count,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
    };
