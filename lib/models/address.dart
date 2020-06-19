import 'package:json_annotation/json_annotation.dart';


part 'Address.g.dart';

@JsonSerializable()
class Address {
      Address();

  int id;
  @JsonKey(name: 'user_id') int userId;
  String address1;
  String address2;
  String country;
  String state;
  String city;
  @JsonKey(name: 'postal_code') String postalCode;
  @JsonKey(name: 'default_address') bool defaultAddress;
  String name;
  double longitude;
  double latitude;
  bool parseable;
  @JsonKey(name: 'deleted_at') DateTime deletedAt;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;

  factory Address.fromJson(Map<String,dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
