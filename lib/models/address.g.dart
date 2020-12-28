// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address()
    ..id = json['id'] as int
    ..userId = json['user_id'] as int
    ..address1 = json['address1'] as String
    ..address2 = json['address2'] as String
    ..country = json['country'] as String
    ..state = json['state'] as String
    ..city = json['city'] as String
    ..postalCode = json['postal_code'] as String
    ..defaultAddress = json['default_address'] as int
    ..name = json['name'] as String
    ..longitude = (json['longitude'] as num)?.toDouble()
    ..latitude = (json['latitude'] as num)?.toDouble()
    ..parseable = json['parseable'] as int
    ..deletedAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String)
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
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
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
