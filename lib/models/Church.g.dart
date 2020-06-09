// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Church.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Church _$ChurchFromJson(Map<String, dynamic> json) {
  return Church()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..alternateName = json['alternate_name'] as String
    ..parentId = json['parent_id'] as String
    ..userId = json['user_id'] as int
    ..leaderId = json['leader_id'] as int
    ..heirachyGroupId = json['heirachy_group_id'] as int
    ..addressId = json['address_id'] as int
    ..profileMediaId = json['profile_media_id'] as int
    ..slogan = json['slogan'] as String
    ..description = json['description'] as String
    ..verified = json['verified'] as int
    ..deletedAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String)
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..address = json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>)
    ..profileMedia = json['profile_media'] == null
        ? null
        : ProfileMedia.fromJson(json['profile_media'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ChurchToJson(Church instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternate_name': instance.alternateName,
      'parent_id': instance.parentId,
      'user_id': instance.userId,
      'leader_id': instance.leaderId,
      'heirachy_group_id': instance.heirachyGroupId,
      'address_id': instance.addressId,
      'profile_media_id': instance.profileMediaId,
      'slogan': instance.slogan,
      'description': instance.description,
      'verified': instance.verified,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'address': instance.address,
      'profile_media': instance.profileMedia,
    };
