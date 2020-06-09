// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Society.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Society _$SocietyFromJson(Map<String, dynamic> json) {
  return Society()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..churchId = json['church_id'] as int
    ..parentId = json['parent_id'] as int
    ..closed = json['closed'] as int
    ..profileMediaId = json['profile_media_id'] as int
    ..userId = json['user_id'] as int
    ..heirachyGroupId = json['heirachy_group_id'] as int
    ..description = json['description'] as String
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
    ..profileMedia = json['profile_media'] == null
        ? null
        : ProfileMedia.fromJson(json['profile_media'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SocietyToJson(Society instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'church_id': instance.churchId,
      'parent_id': instance.parentId,
      'closed': instance.closed,
      'profile_media_id': instance.profileMediaId,
      'user_id': instance.userId,
      'heirachy_group_id': instance.heirachyGroupId,
      'description': instance.description,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'church': instance.church,
      'profile_media': instance.profileMedia,
    };
