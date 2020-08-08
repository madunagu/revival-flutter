// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..churchId = json['church_id'] as int
    ..startingAt = json['starting_at'] == null
        ? null
        : DateTime.parse(json['starting_at'] as String)
    ..endingAt = json['ending_at'] == null
        ? null
        : DateTime.parse(json['ending_at'] as String)
    ..addressId = json['address_id'] as int
    ..heirachyGroupId = json['heirachy_group_id'] as int
    ..profileMediaId = json['profile_media_id'] as int
    ..userId = json['user_id'] as int
    ..deletedAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String)
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..church = json['church'] == null
        ? null
        : Church.fromJson(json['church'] as Map<String, dynamic>)
    ..address = json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'church_id': instance.churchId,
      'starting_at': instance.startingAt?.toIso8601String(),
      'ending_at': instance.endingAt?.toIso8601String(),
      'address_id': instance.addressId,
      'heirachy_group_id': instance.heirachyGroupId,
      'profile_media_id': instance.profileMediaId,
      'user_id': instance.userId,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'church': instance.church,
      'address': instance.address,
    };
