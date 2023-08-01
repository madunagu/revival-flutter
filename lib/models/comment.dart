import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Comment {

  const Comment({
    required this.id,
    required this.parentId,
    required this.comment,
    required this.userId,
    required this.liked,
    required this.user,
    required this.commentableId,
    required this.commentableType,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int parentId;
  final String comment;
  final int userId;
  final int liked;
  final User user;
  final int commentableId;
  final String commentableType;
  final DateTime deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Comment.fromJson(Map<String,dynamic> json) => Comment(
    id: json['id'] as int,
    parentId: json['parent_id'] as int,
    comment: json['comment'].toString(),
    userId: json['user_id'] as int,
    liked: json['liked'] as int,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    commentableId: json['commentable_id'] as int,
    commentableType: json['commentable_type'].toString(),
    deletedAt: DateTime.parse(json['deleted_at'] as String),
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String)
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'parent_id': parentId,
    'comment': comment,
    'user_id': userId,
    'liked': liked,
    'user': user.toJson(),
    'commentable_id': commentableId,
    'commentable_type': commentableType,
    'deleted_at': deletedAt.toIso8601String(),
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String()
  };

  Comment clone() => Comment(
    id: id,
    parentId: parentId,
    comment: comment,
    userId: userId,
    liked: liked,
    user: user.clone(),
    commentableId: commentableId,
    commentableType: commentableType,
    deletedAt: deletedAt,
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  Comment copyWith({
    int? id,
    int? parentId,
    String? comment,
    int? userId,
    int? liked,
    User? user,
    int? commentableId,
    String? commentableType,
    DateTime? deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt
  }) => Comment(
    id: id ?? this.id,
    parentId: parentId ?? this.parentId,
    comment: comment ?? this.comment,
    userId: userId ?? this.userId,
    liked: liked ?? this.liked,
    user: user ?? this.user,
    commentableId: commentableId ?? this.commentableId,
    commentableType: commentableType ?? this.commentableType,
    deletedAt: deletedAt ?? this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Comment && id == other.id && parentId == other.parentId && comment == other.comment && userId == other.userId && liked == other.liked && user == other.user && commentableId == other.commentableId && commentableType == other.commentableType && deletedAt == other.deletedAt && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => id.hashCode ^ parentId.hashCode ^ comment.hashCode ^ userId.hashCode ^ liked.hashCode ^ user.hashCode ^ commentableId.hashCode ^ commentableType.hashCode ^ deletedAt.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
