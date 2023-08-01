import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class User {

  const User({
    required this.id,
    required this.name,
    required this.avatar,
    required this.email,
    required this.emailVerifiedAt,
    required this.assignedAt,
    required this.phone,
    required this.gender,
    required this.followerCount,
    required this.messagesCount,
    required this.notificationsCount,
    required this.isFollowing,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String avatar;
  final String email;
  final DateTime emailVerifiedAt;
  final DateTime assignedAt;
  final String phone;
  final String gender;
  final int followerCount;
  final int messagesCount;
  final int notificationsCount;
  final int isFollowing;
  final List<ResizedImage> images;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory User.fromJson(Map<String,dynamic> json) => User(
    id: json['id'] as int,
    name: json['name'].toString(),
    avatar: json['avatar'].toString(),
    email: json['email'].toString(),
    emailVerifiedAt: DateTime.parse(json['email_verified_at'] as String),
    assignedAt: DateTime.parse(json['assigned_at'] as String),
    phone: json['phone'].toString(),
    gender: json['gender'].toString(),
    followerCount: json['follower_count'] as int,
    messagesCount: json['messages_count'] as int,
    notificationsCount: json['notifications_count'] as int,
    isFollowing: json['is_following'] as int,
    images: (json['images'] as List? ?? []).map((e) => ResizedImage.fromJson(e as Map<String, dynamic>)).toList(),
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String)
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'avatar': avatar,
    'email': email,
    'email_verified_at': emailVerifiedAt.toIso8601String(),
    'assigned_at': assignedAt.toIso8601String(),
    'phone': phone,
    'gender': gender,
    'follower_count': followerCount,
    'messages_count': messagesCount,
    'notifications_count': notificationsCount,
    'is_following': isFollowing,
    'images': images.map((e) => e.toJson()).toList(),
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String()
  };

  User clone() => User(
    id: id,
    name: name,
    avatar: avatar,
    email: email,
    emailVerifiedAt: emailVerifiedAt,
    assignedAt: assignedAt,
    phone: phone,
    gender: gender,
    followerCount: followerCount,
    messagesCount: messagesCount,
    notificationsCount: notificationsCount,
    isFollowing: isFollowing,
    images: images.map((e) => e.clone()).toList(),
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  User copyWith({
    int? id,
    String? name,
    String? avatar,
    String? email,
    DateTime? emailVerifiedAt,
    DateTime? assignedAt,
    String? phone,
    String? gender,
    int? followerCount,
    int? messagesCount,
    int? notificationsCount,
    int? isFollowing,
    List<ResizedImage>? images,
    DateTime? createdAt,
    DateTime? updatedAt
  }) => User(
    id: id ?? this.id,
    name: name ?? this.name,
    avatar: avatar ?? this.avatar,
    email: email ?? this.email,
    emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
    assignedAt: assignedAt ?? this.assignedAt,
    phone: phone ?? this.phone,
    gender: gender ?? this.gender,
    followerCount: followerCount ?? this.followerCount,
    messagesCount: messagesCount ?? this.messagesCount,
    notificationsCount: notificationsCount ?? this.notificationsCount,
    isFollowing: isFollowing ?? this.isFollowing,
    images: images ?? this.images,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is User && id == other.id && name == other.name && avatar == other.avatar && email == other.email && emailVerifiedAt == other.emailVerifiedAt && assignedAt == other.assignedAt && phone == other.phone && gender == other.gender && followerCount == other.followerCount && messagesCount == other.messagesCount && notificationsCount == other.notificationsCount && isFollowing == other.isFollowing && images == other.images && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ avatar.hashCode ^ email.hashCode ^ emailVerifiedAt.hashCode ^ assignedAt.hashCode ^ phone.hashCode ^ gender.hashCode ^ followerCount.hashCode ^ messagesCount.hashCode ^ notificationsCount.hashCode ^ isFollowing.hashCode ^ images.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
