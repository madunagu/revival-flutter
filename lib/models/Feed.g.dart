// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed()
    ..id = json['id'] as int
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String
    ..parentableType = json['parentable_type'] as String
    ..parentableId = json['parentable_id'] as int
    ..postableType = json['postable_type'] as String
    ..postableId = json['postable_id'] as int
    ..parentable = json['parentable'] as String
    ..deletedAt = json['deleted_at'];
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'parentable_type': instance.parentableType,
      'parentable_id': instance.parentableId,
      'postable_type': instance.postableType,
      'postable_id': instance.postableId,
      'parentable': instance.parentable,
      'deleted_at': instance.deletedAt,
    };
