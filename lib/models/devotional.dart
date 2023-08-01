import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Devotional extends Model {

  const Devotional({
    required this.id,
    required this.userId,
    required this.title,
    required this.openingPrayer,
    required this.closingPrayer,
    required this.memoryVerse,
    required this.body,
    required this.posterType,
    required this.poster,
    required this.day,
    required this.devoted,
    required this.devoteesCount,
    required this.devotees,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  }) : super(0);

  final int id;
  final int userId;
  final String title;
  final String openingPrayer;
  final String closingPrayer;
  final String memoryVerse;
  final String body;
  final String posterType;
  final Poster poster;
  final DateTime day;
  final int devoted;
  final int devoteesCount;
  final List<User> devotees;
  final List<ResizedImage> images;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Devotional.fromJson(Map<String,dynamic> json) => Devotional(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    title: json['title'].toString(),
    openingPrayer: json['opening_prayer'].toString(),
    closingPrayer: json['closing_prayer'].toString(),
    memoryVerse: json['memory_verse'].toString(),
    body: json['body'].toString(),
    posterType: json['poster_type'].toString(),
    poster: Poster.fromJson(json['poster'] as Map<String, dynamic>),
    day: DateTime.parse(json['day'] as String),
    devoted: json['devoted'] as int,
    devoteesCount: json['devotees_count'] as int,
    devotees: (json['devotees'] as List? ?? []).map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
    images: (json['images'] as List? ?? []).map((e) => ResizedImage.fromJson(e as Map<String, dynamic>)).toList(),
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String)
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'title': title,
    'opening_prayer': openingPrayer,
    'closing_prayer': closingPrayer,
    'memory_verse': memoryVerse,
    'body': body,
    'poster_type': posterType,
    'poster': poster.toJson(),
    'day': day.toIso8601String(),
    'devoted': devoted,
    'devotees_count': devoteesCount,
    'devotees': devotees.map((e) => e.toJson()).toList(),
    'images': images.map((e) => e.toJson()).toList(),
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String()
  };

  Devotional clone() => Devotional(
    id: id,
    userId: userId,
    title: title,
    openingPrayer: openingPrayer,
    closingPrayer: closingPrayer,
    memoryVerse: memoryVerse,
    body: body,
    posterType: posterType,
    poster: poster.clone(),
    day: day,
    devoted: devoted,
    devoteesCount: devoteesCount,
    devotees: devotees.map((e) => e.clone()).toList(),
    images: images.map((e) => e.clone()).toList(),
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  Devotional copyWith({
    int? id,
    int? userId,
    String? title,
    String? openingPrayer,
    String? closingPrayer,
    String? memoryVerse,
    String? body,
    String? posterType,
    Poster? poster,
    DateTime? day,
    int? devoted,
    int? devoteesCount,
    List<User>? devotees,
    List<ResizedImage>? images,
    DateTime? createdAt,
    DateTime? updatedAt
  }) => Devotional(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    openingPrayer: openingPrayer ?? this.openingPrayer,
    closingPrayer: closingPrayer ?? this.closingPrayer,
    memoryVerse: memoryVerse ?? this.memoryVerse,
    body: body ?? this.body,
    posterType: posterType ?? this.posterType,
    poster: poster ?? this.poster,
    day: day ?? this.day,
    devoted: devoted ?? this.devoted,
    devoteesCount: devoteesCount ?? this.devoteesCount,
    devotees: devotees ?? this.devotees,
    images: images ?? this.images,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Devotional && id == other.id && userId == other.userId && title == other.title && openingPrayer == other.openingPrayer && closingPrayer == other.closingPrayer && memoryVerse == other.memoryVerse && body == other.body && posterType == other.posterType && poster == other.poster && day == other.day && devoted == other.devoted && devoteesCount == other.devoteesCount && devotees == other.devotees && images == other.images && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => id.hashCode ^ userId.hashCode ^ title.hashCode ^ openingPrayer.hashCode ^ closingPrayer.hashCode ^ memoryVerse.hashCode ^ body.hashCode ^ posterType.hashCode ^ poster.hashCode ^ day.hashCode ^ devoted.hashCode ^ devoteesCount.hashCode ^ devotees.hashCode ^ images.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
