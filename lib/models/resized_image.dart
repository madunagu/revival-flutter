import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class ResizedImage {

  const ResizedImage({
    required this.id,
    required this.large,
    required this.medium,
    required this.small,
    required this.full,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String large;
  final String medium;
  final String small;
  final String full;
  final int userId;
  final String createdAt;
  final String updatedAt;

  factory ResizedImage.fromJson(Map<String,dynamic> json) => ResizedImage(
    id: json['id'] as int,
    large: json['large'].toString(),
    medium: json['medium'].toString(),
    small: json['small'].toString(),
    full: json['full'].toString(),
    userId: json['user_id'] as int,
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'large': large,
    'medium': medium,
    'small': small,
    'full': full,
    'user_id': userId,
    'created_at': createdAt,
    'updated_at': updatedAt
  };

  ResizedImage clone() => ResizedImage(
    id: id,
    large: large,
    medium: medium,
    small: small,
    full: full,
    userId: userId,
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  ResizedImage copyWith({
    int? id,
    String? large,
    String? medium,
    String? small,
    String? full,
    int? userId,
    String? createdAt,
    String? updatedAt
  }) => ResizedImage(
    id: id ?? this.id,
    large: large ?? this.large,
    medium: medium ?? this.medium,
    small: small ?? this.small,
    full: full ?? this.full,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResizedImage && id == other.id && large == other.large && medium == other.medium && small == other.small && full == other.full && userId == other.userId && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => id.hashCode ^ large.hashCode ^ medium.hashCode ^ small.hashCode ^ full.hashCode ^ userId.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
