// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Playable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playable _$PlayableFromJson(Map<String, dynamic> json) {
  return Playable()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..srcUrl = json['src_url'] as String
    ..fullText = json['full_text'] as String
    ..description = json['description'] as String
    ..authorId = json['author_id'] as int
    ..uploaderId = json['uploader_id'] as int
    ..type = json['type'] as String
    ..size = json['size'] as int
    ..length = json['length'] as int
    ..language = json['language'] as String
    ..deletedAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String)
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
    ..addresses = (json['addresses'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PlayableToJson(Playable instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'src_url': instance.srcUrl,
      'full_text': instance.fullText,
      'description': instance.description,
      'author_id': instance.authorId,
      'uploader_id': instance.uploaderId,
      'type': instance.type,
      'size': instance.size,
      'length': instance.length,
      'language': instance.language,
      'deleted_at': instance.deletedAt?.toIso8601String(),
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
      'addresses': instance.addresses,
    };
