// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed()
    ..id = json['id'] as int
    ..parentableType = json['parentable_type'] as String
    ..postableType = json['postable_type'] as String
    ..postableId = json['postable_id'] as int
    ..parentableId = json['parentable_id'] as int
    ..createdAt = json['created_at']
    ..updatedAt = json['updated_at'];
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'id': instance.id,
      'parentable_type': instance.parentableType,
      'postable_type': instance.postableType,
      'postable_id': instance.postableId,
      'parentable_id': instance.parentableId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
