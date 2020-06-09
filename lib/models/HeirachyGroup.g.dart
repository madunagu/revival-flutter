// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HeirachyGroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeirachyGroup _$HeirachyGroupFromJson(Map<String, dynamic> json) {
  return HeirachyGroup()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..userId = json['user_id'] as int
    ..deletedAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String)
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..heirachies = (json['heirachies'] as List)
        ?.map((e) =>
            e == null ? null : Heirachy.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$HeirachyGroupToJson(HeirachyGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'user_id': instance.userId,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'heirachies': instance.heirachies,
    };
