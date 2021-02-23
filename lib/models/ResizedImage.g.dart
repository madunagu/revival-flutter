// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResizedImage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResizedImage _$ResizedImageFromJson(Map<String, dynamic> json) {
  return ResizedImage()
    ..id = json['id'] as int
    ..large = json['large'] as String
    ..medium = json['medium'] as String
    ..small = json['small'] as String
    ..full = json['full'] as String
    ..userId = json['user_id'] as String
    ..imageableId = json['imageable_id'] as int
    ..imageableType = json['imageable_type'] as String
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String;
}

Map<String, dynamic> _$ResizedImageToJson(ResizedImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'full': instance.full,
      'user_id': instance.userId,
      'imageable_id': instance.imageableId,
      'imageable_type': instance.imageableType,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
