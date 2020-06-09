// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Heirachy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Heirachy _$HeirachyFromJson(Map<String, dynamic> json) {
  return Heirachy()
    ..id = json['id'] as int
    ..heirachyGroupId = json['heirachy_group_id'] as int
    ..rank = json['rank'] as int
    ..positionName = json['position_name'] as String
    ..positionSlang = json['position_slang'] as String
    ..personName = json['person_name'] as String
    ..userId = json['user_id'] as int
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..deletedAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String)
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$HeirachyToJson(Heirachy instance) => <String, dynamic>{
      'id': instance.id,
      'heirachy_group_id': instance.heirachyGroupId,
      'rank': instance.rank,
      'position_name': instance.positionName,
      'position_slang': instance.positionSlang,
      'person_name': instance.personName,
      'user_id': instance.userId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'user': instance.user,
    };
