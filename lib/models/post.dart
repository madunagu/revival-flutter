import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Post {

  const Post({
    required this.id,
    required this.name,
    required this.body,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.commentsCount,
    required this.likesCount,
    required this.liked,
    required this.viewsCount,
    required this.viewed,
    required this.comments,
    required this.user,
    required this.churches,
    required this.images,
    required this.addresses,
  });

  final int id;
  final String name;
  final String body;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int commentsCount;
  final int likesCount;
  final int liked;
  final int viewsCount;
  final int viewed;
  final List<Comment> comments;
  final User user;
  final List<Church> churches;
  final List<ResizedImage> images;
  final List<Address> addresses;

  factory Post.fromJson(Map<String,dynamic> json) => Post(
    id: json['id'] as int,
    name: json['name'].toString(),
    body: json['body'].toString(),
    userId: json['user_id'] as int,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    commentsCount: json['comments_count'] as int,
    likesCount: json['likes_count'] as int,
    liked: json['liked'] as int,
    viewsCount: json['views_count'] as int,
    viewed: json['viewed'] as int,
    comments: (json['comments'] as List? ?? []).map((e) => Comment.fromJson(e as Map<String, dynamic>)).toList(),
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    churches: (json['churches'] as List? ?? []).map((e) => Church.fromJson(e as Map<String, dynamic>)).toList(),
    images: (json['images'] as List? ?? []).map((e) => ResizedImage.fromJson(e as Map<String, dynamic>)).toList(),
    addresses: (json['addresses'] as List? ?? []).map((e) => Address.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'body': body,
    'user_id': userId,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'comments_count': commentsCount,
    'likes_count': likesCount,
    'liked': liked,
    'views_count': viewsCount,
    'viewed': viewed,
    'comments': comments.map((e) => e.toJson()).toList(),
    'user': user.toJson(),
    'churches': churches.map((e) => e.toJson()).toList(),
    'images': images.map((e) => e.toJson()).toList(),
    'addresses': addresses.map((e) => e.toJson()).toList()
  };

  Post clone() => Post(
    id: id,
    name: name,
    body: body,
    userId: userId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    commentsCount: commentsCount,
    likesCount: likesCount,
    liked: liked,
    viewsCount: viewsCount,
    viewed: viewed,
    comments: comments.map((e) => e.clone()).toList(),
    user: user.clone(),
    churches: churches.map((e) => e.clone()).toList(),
    images: images.map((e) => e.clone()).toList(),
    addresses: addresses.map((e) => e.clone()).toList()
  );


  Post copyWith({
    int? id,
    String? name,
    String? body,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? commentsCount,
    int? likesCount,
    int? liked,
    int? viewsCount,
    int? viewed,
    List<Comment>? comments,
    User? user,
    List<Church>? churches,
    List<ResizedImage>? images,
    List<Address>? addresses
  }) => Post(
    id: id ?? this.id,
    name: name ?? this.name,
    body: body ?? this.body,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    commentsCount: commentsCount ?? this.commentsCount,
    likesCount: likesCount ?? this.likesCount,
    liked: liked ?? this.liked,
    viewsCount: viewsCount ?? this.viewsCount,
    viewed: viewed ?? this.viewed,
    comments: comments ?? this.comments,
    user: user ?? this.user,
    churches: churches ?? this.churches,
    images: images ?? this.images,
    addresses: addresses ?? this.addresses,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Post && id == other.id && name == other.name && body == other.body && userId == other.userId && createdAt == other.createdAt && updatedAt == other.updatedAt && commentsCount == other.commentsCount && likesCount == other.likesCount && liked == other.liked && viewsCount == other.viewsCount && viewed == other.viewed && comments == other.comments && user == other.user && churches == other.churches && images == other.images && addresses == other.addresses;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ body.hashCode ^ userId.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ commentsCount.hashCode ^ likesCount.hashCode ^ liked.hashCode ^ viewsCount.hashCode ^ viewed.hashCode ^ comments.hashCode ^ user.hashCode ^ churches.hashCode ^ images.hashCode ^ addresses.hashCode;
}
