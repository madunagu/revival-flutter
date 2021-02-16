// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResizedImage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResizedImage _$ResizedImageFromJson(Map<String, dynamic> json) {
  return ResizedImage()
    ..id = json['id'] as int
    ..largeUrl = json['large_url'] as String
    ..mediumUrl = json['medium_url'] as String
    ..smallUrl = json['small_url'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..fullUrl = json['full_url'] as String
    ..userId = json['user_id'] as String
    ..imageableId = json['imageable_id'] as int
    ..imageableType = json['imageable_type'] as String
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String;
}

Map<String, dynamic> _$ResizedImageToJson(ResizedImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'large_url': instance.largeUrl,
      'medium_url': instance.mediumUrl,
      'small_url': instance.smallUrl,
      'avatar_url': instance.avatarUrl,
      'full_url': instance.fullUrl,
      'user_id': instance.userId,
      'imageable_id': instance.imageableId,
      'imageable_type': instance.imageableType,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
