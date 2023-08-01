import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Hierarchy {

  const Hierarchy({
    required this.id,
    required this.heirachyGroupId,
    required this.rank,
    required this.positionName,
    required this.positionSlang,
    required this.personName,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  final int id;
  final int heirachyGroupId;
  final int rank;
  final String positionName;
  final String positionSlang;
  final String personName;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  factory Hierarchy.fromJson(Map<String,dynamic> json) => Hierarchy(
    id: json['id'] as int,
    heirachyGroupId: json['heirachy_group_id'] as int,
    rank: json['rank'] as int,
    positionName: json['position_name'].toString(),
    positionSlang: json['position_slang'].toString(),
    personName: json['person_name'].toString(),
    userId: json['user_id'] as int,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    user: User.fromJson(json['user'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'heirachy_group_id': heirachyGroupId,
    'rank': rank,
    'position_name': positionName,
    'position_slang': positionSlang,
    'person_name': personName,
    'user_id': userId,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'user': user.toJson()
  };

  Hierarchy clone() => Hierarchy(
    id: id,
    heirachyGroupId: heirachyGroupId,
    rank: rank,
    positionName: positionName,
    positionSlang: positionSlang,
    personName: personName,
    userId: userId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    user: user.clone()
  );


  Hierarchy copyWith({
    int? id,
    int? heirachyGroupId,
    int? rank,
    String? positionName,
    String? positionSlang,
    String? personName,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    User? user
  }) => Hierarchy(
    id: id ?? this.id,
    heirachyGroupId: heirachyGroupId ?? this.heirachyGroupId,
    rank: rank ?? this.rank,
    positionName: positionName ?? this.positionName,
    positionSlang: positionSlang ?? this.positionSlang,
    personName: personName ?? this.personName,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    user: user ?? this.user,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Hierarchy && id == other.id && heirachyGroupId == other.heirachyGroupId && rank == other.rank && positionName == other.positionName && positionSlang == other.positionSlang && personName == other.personName && userId == other.userId && createdAt == other.createdAt && updatedAt == other.updatedAt && user == other.user;

  @override
  int get hashCode => id.hashCode ^ heirachyGroupId.hashCode ^ rank.hashCode ^ positionName.hashCode ^ positionSlang.hashCode ^ personName.hashCode ^ userId.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ user.hashCode;
}
