// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AudioMessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioMessage _$AudioMessageFromJson(Map<String, dynamic> json) {
  return AudioMessage()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..srcUrl = json['src_url'] as String
    ..fullText = json['full_text'] as String
    ..description = json['description'] as String
    ..authorId = json['author_id'] as int
    ..uploaderId = json['uploader_id'] as int
    ..churchId = json['church_id'] as int
    ..size = json['size'] as int
    ..length = json['length'] as int
    ..profileMediaId = json['profile_media_id'] as int
    ..language = json['language'] as String
    ..addressId = json['address_id'] as int
    ..deletedAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String)
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..church = json['church'] == null
        ? null
        : Church.fromJson(json['church'] as Map<String, dynamic>)
    ..author = json['author'] == null
        ? null
        : User.fromJson(json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AudioMessageToJson(AudioMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'src_url': instance.srcUrl,
      'full_text': instance.fullText,
      'description': instance.description,
      'author_id': instance.authorId,
      'uploader_id': instance.uploaderId,
      'church_id': instance.churchId,
      'size': instance.size,
      'length': instance.length,
      'profile_media_id': instance.profileMediaId,
      'language': instance.language,
      'address_id': instance.addressId,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'church': instance.church,
      'author': instance.author,
    };
