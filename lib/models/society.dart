import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Society {

  const Society({
    required this.id,
    required this.name,
    required this.parentId,
    required this.closed,
    required this.userId,
    required this.description,
    required this.verified,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.commentsCount,
    required this.likesCount,
    required this.liked,
    required this.viewsCount,
    required this.viewed,
    required this.comments,
    required this.leader,
    required this.user,
    required this.addresses,
    required this.churches,
    required this.images,
  });

  final int id;
  final String name;
  final int parentId;
  final int closed;
  final int userId;
  final String description;
  final int verified;
  final DateTime deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int commentsCount;
  final int likesCount;
  final int liked;
  final int viewsCount;
  final int viewed;
  final List<Comment> comments;
  final User leader;
  final User user;
  final List<Address> addresses;
  final List<Church> churches;
  final List<ResizedImage> images;

  factory Society.fromJson(Map<String,dynamic> json) => Society(
    id: json['id'] as int,
    name: json['name'].toString(),
    parentId: json['parent_id'] as int,
    closed: json['closed'] as int,
    userId: json['user_id'] as int,
    description: json['description'].toString(),
    verified: json['verified'] as int,
    deletedAt: DateTime.parse(json['deleted_at'] as String),
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    commentsCount: json['comments_count'] as int,
    likesCount: json['likes_count'] as int,
    liked: json['liked'] as int,
    viewsCount: json['views_count'] as int,
    viewed: json['viewed'] as int,
    comments: (json['comments'] as List? ?? []).map((e) => Comment.fromJson(e as Map<String, dynamic>)).toList(),
    leader: User.fromJson(json['leader'] as Map<String, dynamic>),
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    addresses: (json['addresses'] as List? ?? []).map((e) => Address.fromJson(e as Map<String, dynamic>)).toList(),
    churches: (json['churches'] as List? ?? []).map((e) => Church.fromJson(e as Map<String, dynamic>)).toList(),
    images: (json['images'] as List? ?? []).map((e) => ResizedImage.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'parent_id': parentId,
    'closed': closed,
    'user_id': userId,
    'description': description,
    'verified': verified,
    'deleted_at': deletedAt.toIso8601String(),
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'comments_count': commentsCount,
    'likes_count': likesCount,
    'liked': liked,
    'views_count': viewsCount,
    'viewed': viewed,
    'comments': comments.map((e) => e.toJson()).toList(),
    'leader': leader.toJson(),
    'user': user.toJson(),
    'addresses': addresses.map((e) => e.toJson()).toList(),
    'churches': churches.map((e) => e.toJson()).toList(),
    'images': images.map((e) => e.toJson()).toList()
  };

  Society clone() => Society(
    id: id,
    name: name,
    parentId: parentId,
    closed: closed,
    userId: userId,
    description: description,
    verified: verified,
    deletedAt: deletedAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
    commentsCount: commentsCount,
    likesCount: likesCount,
    liked: liked,
    viewsCount: viewsCount,
    viewed: viewed,
    comments: comments.map((e) => e.clone()).toList(),
    leader: leader.clone(),
    user: user.clone(),
    addresses: addresses.map((e) => e.clone()).toList(),
    churches: churches.map((e) => e.clone()).toList(),
    images: images.map((e) => e.clone()).toList()
  );


  Society copyWith({
    int? id,
    String? name,
    int? parentId,
    int? closed,
    int? userId,
    String? description,
    int? verified,
    DateTime? deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? commentsCount,
    int? likesCount,
    int? liked,
    int? viewsCount,
    int? viewed,
    List<Comment>? comments,
    User? leader,
    User? user,
    List<Address>? addresses,
    List<Church>? churches,
    List<ResizedImage>? images
  }) => Society(
    id: id ?? this.id,
    name: name ?? this.name,
    parentId: parentId ?? this.parentId,
    closed: closed ?? this.closed,
    userId: userId ?? this.userId,
    description: description ?? this.description,
    verified: verified ?? this.verified,
    deletedAt: deletedAt ?? this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    commentsCount: commentsCount ?? this.commentsCount,
    likesCount: likesCount ?? this.likesCount,
    liked: liked ?? this.liked,
    viewsCount: viewsCount ?? this.viewsCount,
    viewed: viewed ?? this.viewed,
    comments: comments ?? this.comments,
    leader: leader ?? this.leader,
    user: user ?? this.user,
    addresses: addresses ?? this.addresses,
    churches: churches ?? this.churches,
    images: images ?? this.images,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Society && id == other.id && name == other.name && parentId == other.parentId && closed == other.closed && userId == other.userId && description == other.description && verified == other.verified && deletedAt == other.deletedAt && createdAt == other.createdAt && updatedAt == other.updatedAt && commentsCount == other.commentsCount && likesCount == other.likesCount && liked == other.liked && viewsCount == other.viewsCount && viewed == other.viewed && comments == other.comments && leader == other.leader && user == other.user && addresses == other.addresses && churches == other.churches && images == other.images;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ parentId.hashCode ^ closed.hashCode ^ userId.hashCode ^ description.hashCode ^ verified.hashCode ^ deletedAt.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ commentsCount.hashCode ^ likesCount.hashCode ^ liked.hashCode ^ viewsCount.hashCode ^ viewed.hashCode ^ comments.hashCode ^ leader.hashCode ^ user.hashCode ^ addresses.hashCode ^ churches.hashCode ^ images.hashCode;
}
