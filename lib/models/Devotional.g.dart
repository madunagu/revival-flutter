// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Devotional.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Devotional _$DevotionalFromJson(Map<String, dynamic> json) {
  return Devotional()
    ..id = json['id'] as int
    ..userId = json['user_id'] as int
    ..title = json['title'] as String
    ..openingPrayer = json['opening_prayer'] as String
    ..closingPrayer = json['closing_prayer'] as String
    ..memoryVerse = json['memory_verse'] as String
    ..body = json['body'] as String
    ..posterType = json['poster_type'] as String
    ..day = json['day'] == null ? null : DateTime.parse(json['day'] as String)
    ..devoted = json['devoted'] as int
    ..devoteesCount = json['devotees_count'] as int
    ..devotees = (json['devotees'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..images = (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ImageSource.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
}

Map<String, dynamic> _$DevotionalToJson(Devotional instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'opening_prayer': instance.openingPrayer,
      'closing_prayer': instance.closingPrayer,
      'memory_verse': instance.memoryVerse,
      'body': instance.body,
      'poster_type': instance.posterType,
      'day': instance.day?.toIso8601String(),
      'devoted': instance.devoted,
      'devotees_count': instance.devoteesCount,
      'devotees': instance.devotees,
      'user': instance.user,
      'images': instance.images,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
