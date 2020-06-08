// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..apiToken = json['api_token']
    ..email = json['email'] as String
    ..emailVerifiedAt = json['email_verified_at'] as String
    ..phone = json['phone']
    ..gender = json['gender']
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'api_token': instance.apiToken,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'phone': instance.phone,
      'gender': instance.gender,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
