// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Poster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poster _$PosterFromJson(Map<String, dynamic> json) {
  return Poster()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..images = (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ResizedImage.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PosterToJson(Poster instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'images': instance.images,
    };
