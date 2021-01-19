// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..body = json['body'] as String
    ..userId = json['user_id'] as int
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
    ..comments = json['comments'] as List
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..churches = (json['churches'] as List)
        ?.map((e) =>
            e == null ? null : Church.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..images = (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ImageSource.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..addresses = (json['addresses'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'body': instance.body,
      'user_id': instance.userId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'comments_count': instance.commentsCount,
      'likes_count': instance.likesCount,
      'liked': instance.liked,
      'views_count': instance.viewsCount,
      'viewed': instance.viewed,
      'comments': instance.comments,
      'user': instance.user,
      'churches': instance.churches,
      'images': instance.images,
      'addresses': instance.addresses,
    };
