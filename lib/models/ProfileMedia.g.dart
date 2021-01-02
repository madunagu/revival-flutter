// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileMedia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileMedia _$ProfileMediaFromJson(Map<String, dynamic> json) {
  return ProfileMedia()
    ..id = json['id'] as int
    ..logoUrl = json['logo_url'] as String
    ..profileImageUrl = json['profile_image_url'] as String
    ..backgroundImageUrl = json['background_image_url'] as String
    ..colorChoice = json['color_choice'] as String
    ..userId = json['user_id'] as int
    ..profileMediableId = json['profile_mediable_id']
    ..profileMediableType = json['profile_mediable_type']
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
}

Map<String, dynamic> _$ProfileMediaToJson(ProfileMedia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_url': instance.logoUrl,
      'profile_image_url': instance.profileImageUrl,
      'background_image_url': instance.backgroundImageUrl,
      'color_choice': instance.colorChoice,
      'user_id': instance.userId,
      'profile_mediable_id': instance.profileMediableId,
      'profile_mediable_type': instance.profileMediableType,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
