import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Address.g.dart';

@JsonSerializable()
class Address {
  Address();

  @JsonKey(includeIfNull: false)
  int id;

  @JsonKey(name: 'user_id', includeIfNull: false)
  int userId;
  String address1;
  String address2;
  String country;
  String state;
  String city;
  @JsonKey(name: 'postal_code', includeIfNull: false)
  String postalCode;
  @JsonKey(name: 'default_address', includeIfNull: false)
  bool defaultAddress;
  @JsonKey(includeIfNull: false)
  String name;

  @JsonKey(includeIfNull: false)
  double longitude;

  @JsonKey(includeIfNull: false)
  double latitude;

  @JsonKey(includeIfNull: false)
  bool parseable;
  @JsonKey(name: 'deleted_at', includeIfNull: false)
  DateTime deletedAt;
  @JsonKey(name: 'created_at', includeIfNull: false)
  DateTime createdAt;
  @JsonKey(name: 'updated_at', includeIfNull: false)
  DateTime updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
