// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed()
    ..id = json['id'] as int
    ..userId = json['user_id'] as int
    ..followerId = json['follower_id'] as int
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String
    ..type = json['type'] as String
    ..itemId = json['item_id'] as int
    ..poster = json['poster'] as String
    ..posterId = json['poster_id'] as int
    ..name = json['name'] as String
    ..churchId = json['church_id'] as int
    ..startingAt = json['starting_at'] as String
    ..endingAt = json['ending_at'] as String
    ..addressId = json['address_id'] as int
    ..hierarchyGroupId = json['hierarchy_group_id'] as int
    ..profileMediaId = json['profile_media_id'] as int
    ..deletedAt = json['deleted_at'];
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'follower_id': instance.followerId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'type': instance.type,
      'item_id': instance.itemId,
      'poster': instance.poster,
      'poster_id': instance.posterId,
      'name': instance.name,
      'church_id': instance.churchId,
      'starting_at': instance.startingAt,
      'ending_at': instance.endingAt,
      'address_id': instance.addressId,
      'hierarchy_group_id': instance.hierarchyGroupId,
      'profile_media_id': instance.profileMediaId,
      'deleted_at': instance.deletedAt,
    };
