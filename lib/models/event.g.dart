// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event()
    ..id = json['id'] as int
    ..userId = json['user_id'] as int
    ..address1 = json['address1'] as String
    ..address2 = json['address2']
    ..country = json['country'] as String
    ..state = json['state'] as String
    ..city = json['city'] as String
    ..postalCode = json['postal_code'] as String
    ..defaultAddress = json['default_address'] as int
    ..name = json['name'] as String
    ..longitude = (json['longitude'] as num)?.toDouble()
    ..latitude = (json['latitude'] as num)?.toDouble()
    ..parseable = json['parseable'] as int
    ..deletedAt = json['deleted_at']
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String;
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'address1': instance.address1,
      'address2': instance.address2,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'postal_code': instance.postalCode,
      'default_address': instance.defaultAddress,
      'name': instance.name,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'parseable': instance.parseable,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
