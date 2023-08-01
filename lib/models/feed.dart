import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

@immutable
class Feed {
  const Feed({
    required this.id,
    required this.parentableType,
    required this.postableType,
    required this.postableId,
    required this.parentableId,
    required this.createdAt,
    required this.updatedAt,
    required this.parentable,
  });

  final int id;
  final String parentableType;
  final String postableType;
  final int postableId;
  final int parentableId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Model parentable;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
      id: json['id'] as int,
      parentableType: json['parentable_type'].toString(),
      postableType: json['postable_type'].toString(),
      postableId: json['postable_id'] as int,
      parentableId: json['parentable_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      parentable: getParentable(json['parentable'] as Map<String, dynamic>,
          json['parentable_type'].toString()));

  Map<String, dynamic> toJson() => {
        'id': id,
        'parentable_type': parentableType,
        'postable_type': postableType,
        'postable_id': postableId,
        'parentable_id': parentableId,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'parentable': parentable.toJson()
      };

  Feed clone() => Feed(
      id: id,
      parentableType: parentableType,
      postableType: postableType,
      postableId: postableId,
      parentableId: parentableId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      parentable: parentable.clone());

  Feed copyWith(
          {int? id,
          String? parentableType,
          String? postableType,
          int? postableId,
          int? parentableId,
          DateTime? createdAt,
          DateTime? updatedAt,
          Model? parentable}) =>
      Feed(
        id: id ?? this.id,
        parentableType: parentableType ?? this.parentableType,
        postableType: postableType ?? this.postableType,
        postableId: postableId ?? this.postableId,
        parentableId: parentableId ?? this.parentableId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        parentable: parentable ?? this.parentable,
      );

  static getParentable(Map<String, dynamic> parentable, String feedType) {
    switch (feedType) {
      case 'audio':
        return AudioPost.fromJson(parentable);
        break;
      case 'video':
        return VideoPost.fromJson(parentable);
        break;
      case 'event':
        return Event.fromJson(parentable);
        break;
      case 'post':
        return Post.fromJson(parentable);
        break;
      case 'comment':
        return Comment.fromJson(parentable);
        break;
      case 'devotional':
        return Devotional.fromJson(parentable);
        break;
      default:
        Model.fromJson(parentable);
        return;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Feed &&
          id == other.id &&
          parentableType == other.parentableType &&
          postableType == other.postableType &&
          postableId == other.postableId &&
          parentableId == other.parentableId &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          parentable == other.parentable;

  @override
  int get hashCode =>
      id.hashCode ^
      parentableType.hashCode ^
      postableType.hashCode ^
      postableId.hashCode ^
      parentableId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      parentable.hashCode;
}
