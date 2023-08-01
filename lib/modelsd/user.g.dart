// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..avatar = json['avatar'] as String
    ..email = json['email'] as String
    ..emailVerifiedAt = json['email_verified_at'] == null
        ? null
        : DateTime.parse(json['email_verified_at'] as String)
    ..assignedAt = json['assigned_at'] == null
        ? null
        : DateTime.parse(json['assigned_at'] as String)
    ..phone = json['phone'] as String
    ..gender = json['gender'] as String
    ..followerCount = json['follower_count'] as int
    ..isFollowing = json['is_following'] as int
    ..images = (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ResizedImage.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'assigned_at': instance.assignedAt?.toIso8601String(),
      'phone': instance.phone,
      'gender': instance.gender,
      'follower_count': instance.followerCount,
      'is_following': instance.isFollowing,
      'images': instance.images,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
