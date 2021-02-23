// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Society.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Society _$SocietyFromJson(Map<String, dynamic> json) {
  return Society()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..parentId = json['parent_id'] as int
    ..closed = json['closed'] as int
    ..userId = json['user_id'] as int
    ..description = json['description'] as String
    ..verified = json['verified'] as int
    ..deletedAt = json['deleted_at']
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..commentsCount = json['comments_count'] as int
    ..likesCount = json['likes_count'] as int
    ..liked = json['liked'] as int
    ..viewsCount = json['views_count'] as int
    ..viewed = json['viewed'] as int
    ..comments = (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..leader = json['leader'] == null
        ? null
        : User.fromJson(json['leader'] as Map<String, dynamic>)
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..addresses = (json['addresses'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..churches = (json['churches'] as List)
        ?.map((e) =>
            e == null ? null : Church.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..images = (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ResizedImage.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SocietyToJson(Society instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parent_id': instance.parentId,
      'closed': instance.closed,
      'user_id': instance.userId,
      'description': instance.description,
      'verified': instance.verified,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'comments_count': instance.commentsCount,
      'likes_count': instance.likesCount,
      'liked': instance.liked,
      'views_count': instance.viewsCount,
      'viewed': instance.viewed,
      'comments': instance.comments,
      'leader': instance.leader,
      'user': instance.user,
      'addresses': instance.addresses,
      'churches': instance.churches,
      'images': instance.images,
    };
