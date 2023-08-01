import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Church extends Model{

  const Church({
    required this.id,
    required this.name,
    required this.alternateName,
    required this.parentId,
    required this.userId,
    required this.leaderId,
    required this.slogan,
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
    required this.likes,
    required this.user,
    required this.addresses,
    required this.images,
  }) : super(0);

  final int id;
  final String name;
  final String alternateName;
  final int parentId;
  final int userId;
  final int leaderId;
  final String slogan;
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
  final List<User> likes;
  final User user;
  final List<Address> addresses;
  final List<ResizedImage> images;

  factory Church.fromJson(Map<String,dynamic> json) => Church(
    id: json['id'] as int,
    name: json['name'].toString(),
    alternateName: json['alternate_name'].toString(),
    parentId: json['parent_id'] as int,
    userId: json['user_id'] as int,
    leaderId: json['leader_id'] as int,
    slogan: json['slogan'].toString(),
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
    likes: (json['likes'] as List? ?? []).map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    addresses: (json['addresses'] as List? ?? []).map((e) => Address.fromJson(e as Map<String, dynamic>)).toList(),
    images: (json['images'] as List? ?? []).map((e) => ResizedImage.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'alternate_name': alternateName,
    'parent_id': parentId,
    'user_id': userId,
    'leader_id': leaderId,
    'slogan': slogan,
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
    'likes': likes.map((e) => e.toJson()).toList(),
    'user': user.toJson(),
    'addresses': addresses.map((e) => e.toJson()).toList(),
    'images': images.map((e) => e.toJson()).toList()
  };

  Church clone() => Church(
    id: id,
    name: name,
    alternateName: alternateName,
    parentId: parentId,
    userId: userId,
    leaderId: leaderId,
    slogan: slogan,
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
    likes: likes.map((e) => e.clone()).toList(),
    user: user.clone(),
    addresses: addresses.map((e) => e.clone()).toList(),
    images: images.map((e) => e.clone()).toList()
  );


  Church copyWith({
    int? id,
    String? name,
    String? alternateName,
    int? parentId,
    int? userId,
    int? leaderId,
    String? slogan,
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
    List<User>? likes,
    User? user,
    List<Address>? addresses,
    List<ResizedImage>? images
  }) => Church(
    id: id ?? this.id,
    name: name ?? this.name,
    alternateName: alternateName ?? this.alternateName,
    parentId: parentId ?? this.parentId,
    userId: userId ?? this.userId,
    leaderId: leaderId ?? this.leaderId,
    slogan: slogan ?? this.slogan,
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
    likes: likes ?? this.likes,
    user: user ?? this.user,
    addresses: addresses ?? this.addresses,
    images: images ?? this.images,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Church && id == other.id && name == other.name && alternateName == other.alternateName && parentId == other.parentId && userId == other.userId && leaderId == other.leaderId && slogan == other.slogan && description == other.description && verified == other.verified && deletedAt == other.deletedAt && createdAt == other.createdAt && updatedAt == other.updatedAt && commentsCount == other.commentsCount && likesCount == other.likesCount && liked == other.liked && viewsCount == other.viewsCount && viewed == other.viewed && comments == other.comments && leader == other.leader && likes == other.likes && user == other.user && addresses == other.addresses && images == other.images;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ alternateName.hashCode ^ parentId.hashCode ^ userId.hashCode ^ leaderId.hashCode ^ slogan.hashCode ^ description.hashCode ^ verified.hashCode ^ deletedAt.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ commentsCount.hashCode ^ likesCount.hashCode ^ liked.hashCode ^ viewsCount.hashCode ^ viewed.hashCode ^ comments.hashCode ^ leader.hashCode ^ likes.hashCode ^ user.hashCode ^ addresses.hashCode ^ images.hashCode;
}
