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
    ..defaultAddress = json['default_address'] as bool
    ..name = json['name'] as String
    ..longitude = (json['longitude'] as num)?.toDouble()
    ..latitude = (json['latitude'] as num)?.toDouble()
    ..parseable = json['parseable'] as bool
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

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user_id', instance.userId);
  val['address1'] = instance.address1;
  val['address2'] = instance.address2;
  val['country'] = instance.country;
  val['state'] = instance.state;
  val['city'] = instance.city;
  writeNotNull('postal_code', instance.postalCode);
  writeNotNull('default_address', instance.defaultAddress);
  writeNotNull('name', instance.name);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('parseable', instance.parseable);
  writeNotNull('deleted_at', instance.deletedAt?.toIso8601String());
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  return val;
}
