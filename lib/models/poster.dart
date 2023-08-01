import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Poster {

  const Poster({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ResizedImage> images;

  factory Poster.fromJson(Map<String,dynamic> json) => Poster(
    id: json['id'] as int,
    name: json['name'].toString(),
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    images: (json['images'] as List? ?? []).map((e) => ResizedImage.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'images': images.map((e) => e.toJson()).toList()
  };

  Poster clone() => Poster(
    id: id,
    name: name,
    createdAt: createdAt,
    updatedAt: updatedAt,
    images: images.map((e) => e.clone()).toList()
  );


  Poster copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<ResizedImage>? images
  }) => Poster(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    images: images ?? this.images,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Poster && id == other.id && name == other.name && createdAt == other.createdAt && updatedAt == other.updatedAt && images == other.images;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ images.hashCode;
}
