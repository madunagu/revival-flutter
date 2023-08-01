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
    ..parentId = json['parent_id'] as int
    ..userId = json['user_id'] as int
    ..leaderId = json['leader_id'] as int
    ..slogan = json['slogan'] as String
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
    ..likes = (json['likes'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..addresses = json['addresses'] as List
    ..images = (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ResizedImage.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ChurchToJson(Church instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternate_name': instance.alternateName,
      'parent_id': instance.parentId,
      'user_id': instance.userId,
      'leader_id': instance.leaderId,
      'slogan': instance.slogan,
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
      'likes': instance.likes,
      'user': instance.user,
      'addresses': instance.addresses,
      'images': instance.images,
    };
