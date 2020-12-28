// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment()
    ..id = json['id'] as int
    ..parentId = json['parent_id'] as int
    ..comment = json['comment'] as String
    ..userId = json['user_id'] as int
    ..commentableId = json['commentable_id'] as int
    ..commentableType = json['commentable_type'] as String
    ..deletedAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String)
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parentId,
      'comment': instance.comment,
      'user_id': instance.userId,
      'commentable_id': instance.commentableId,
      'commentable_type': instance.commentableType,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
