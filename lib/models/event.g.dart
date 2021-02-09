// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..startingAt = json['starting_at'] == null
        ? null
        : DateTime.parse(json['starting_at'] as String)
    ..endingAt = json['ending_at'] == null
        ? null
        : DateTime.parse(json['ending_at'] as String)
    ..userId = json['user_id'] as int
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..commentsCount = json['comments_count'] as int
    ..attendeesCount = json['attendees_count'] as int
    ..attending = json['attending'] as int
    ..viewsCount = json['views_count'] as int
    ..viewed = json['viewed'] as int
    ..addressId = json['address_id'] as int
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..posterType = json['poster_type'] as String
    ..comments = (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..churches = (json['churches'] as List)
        ?.map((e) =>
            e == null ? null : Church.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..addresses = (json['addresses'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..attendees = (json['attendees'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..profileMedia = (json['profile_media'] as List)
        ?.map((e) =>
            e == null ? null : ProfileMedia.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'starting_at': instance.startingAt?.toIso8601String(),
      'ending_at': instance.endingAt?.toIso8601String(),
      'user_id': instance.userId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'comments_count': instance.commentsCount,
      'attendees_count': instance.attendeesCount,
      'attending': instance.attending,
      'views_count': instance.viewsCount,
      'viewed': instance.viewed,
      'address_id': instance.addressId,
      'user': instance.user,
      'poster_type': instance.posterType,
      'comments': instance.comments,
      'churches': instance.churches,
      'addresses': instance.addresses,
      'attendees': instance.attendees,
      'profile_media': instance.profileMedia,
    };
