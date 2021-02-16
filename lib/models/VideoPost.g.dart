// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VideoPost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoPost _$VideoPostFromJson(Map<String, dynamic> json) {
  return VideoPost()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..srcUrl = json['src_url'] as String
    ..fullText = json['full_text'] as String
    ..description = json['description'] as String
    ..authorId = json['author_id'] as int
    ..uploaderId = json['uploader_id'] as int
    ..size = json['size'] as int
    ..length = json['length'] as int
    ..language = json['language'] as String
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
    ..author = json['author'] == null
        ? null
        : User.fromJson(json['author'] as Map<String, dynamic>)
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..churches = (json['churches'] as List)
        ?.map((e) =>
            e == null ? null : Church.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..images = (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ResizedImage.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..addresses = (json['addresses'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$VideoPostToJson(VideoPost instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'src_url': instance.srcUrl,
      'full_text': instance.fullText,
      'description': instance.description,
      'author_id': instance.authorId,
      'uploader_id': instance.uploaderId,
      'size': instance.size,
      'length': instance.length,
      'language': instance.language,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'comments_count': instance.commentsCount,
      'likes_count': instance.likesCount,
      'liked': instance.liked,
      'views_count': instance.viewsCount,
      'viewed': instance.viewed,
      'comments': instance.comments,
      'author': instance.author,
      'user': instance.user,
      'churches': instance.churches,
      'images': instance.images,
      'addresses': instance.addresses,
    };
