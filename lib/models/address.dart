import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Address {

  const Address({
    required this.id,
    required this.userId,
    required this.address1,
    required this.address2,
    required this.country,
    required this.state,
    required this.city,
    required this.postalCode,
    required this.defaultAddress,
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.parseable,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int userId;
  final String address1;
  final String address2;
  final String country;
  final String state;
  final String city;
  final String postalCode;
  final int defaultAddress;
  final String name;
  final double longitude;
  final double latitude;
  final int parseable;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Address.fromJson(Map<String,dynamic> json) => Address(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    address1: json['address1'].toString(),
    address2: json['address2'].toString(),
    country: json['country'].toString(),
    state: json['state'].toString(),
    city: json['city'].toString(),
    postalCode: json['postal_code'].toString(),
    defaultAddress: json['default_address'] as int,
    name: json['name'].toString(),
    longitude: json['longitude'] as double,
    latitude: json['latitude'] as double,
    parseable: json['parseable'] as int,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String)
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'address1': address1,
    'address2': address2,
    'country': country,
    'state': state,
    'city': city,
    'postal_code': postalCode,
    'default_address': defaultAddress,
    'name': name,
    'longitude': longitude,
    'latitude': latitude,
    'parseable': parseable,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String()
  };

  Address clone() => Address(
    id: id,
    userId: userId,
    address1: address1,
    address2: address2,
    country: country,
    state: state,
    city: city,
    postalCode: postalCode,
    defaultAddress: defaultAddress,
    name: name,
    longitude: longitude,
    latitude: latitude,
    parseable: parseable,
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  Address copyWith({
    int? id,
    int? userId,
    String? address1,
    String? address2,
    String? country,
    String? state,
    String? city,
    String? postalCode,
    int? defaultAddress,
    String? name,
    double? longitude,
    double? latitude,
    int? parseable,
    DateTime? createdAt,
    DateTime? updatedAt
  }) => Address(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    address1: address1 ?? this.address1,
    address2: address2 ?? this.address2,
    country: country ?? this.country,
    state: state ?? this.state,
    city: city ?? this.city,
    postalCode: postalCode ?? this.postalCode,
    defaultAddress: defaultAddress ?? this.defaultAddress,
    name: name ?? this.name,
    longitude: longitude ?? this.longitude,
    latitude: latitude ?? this.latitude,
    parseable: parseable ?? this.parseable,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Address && id == other.id && userId == other.userId && address1 == other.address1 && address2 == other.address2 && country == other.country && state == other.state && city == other.city && postalCode == other.postalCode && defaultAddress == other.defaultAddress && name == other.name && longitude == other.longitude && latitude == other.latitude && parseable == other.parseable && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => id.hashCode ^ userId.hashCode ^ address1.hashCode ^ address2.hashCode ^ country.hashCode ^ state.hashCode ^ city.hashCode ^ postalCode.hashCode ^ defaultAddress.hashCode ^ name.hashCode ^ longitude.hashCode ^ latitude.hashCode ^ parseable.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
