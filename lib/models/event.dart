import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Event extends Model {

  const Event({
    required this.id,
    required this.name,
    required this.description,
    required this.startingAt,
    required this.endingAt,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.commentsCount,
    required this.attendeesCount,
    required this.attending,
    required this.viewsCount,
    required this.viewed,
    required this.user,
    required this.posterType,
    required this.poster,
    required this.comments,
    required this.churches,
    required this.addresses,
    required this.attendees,
    required this.images,
  }) : super(0);

  final int id;
  final String name;
  final String description;
  final DateTime startingAt;
  final DateTime endingAt;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int commentsCount;
  final int attendeesCount;
  final int attending;
  final int viewsCount;
  final int viewed;
  final User user;
  final String posterType;
  final Poster poster;
  final List<Comment> comments;
  final List<Church> churches;
  final List<Address> addresses;
  final List<User> attendees;
  final List<ResizedImage> images;

  factory Event.fromJson(Map<String,dynamic> json) => Event(
    id: json['id'] as int,
    name: json['name'].toString(),
    description: json['description'].toString(),
    startingAt: DateTime.parse(json['starting_at'] as String),
    endingAt: DateTime.parse(json['ending_at'] as String),
    userId: json['user_id'] as int,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    commentsCount: json['comments_count'] as int,
    attendeesCount: json['attendees_count'] as int,
    attending: json['attending'] as int,
    viewsCount: json['views_count'] as int,
    viewed: json['viewed'] as int,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    posterType: json['poster_type'].toString(),
    poster: Poster.fromJson(json['poster'] as Map<String, dynamic>),
    comments: (json['comments'] as List? ?? []).map((e) => Comment.fromJson(e as Map<String, dynamic>)).toList(),
    churches: (json['churches'] as List? ?? []).map((e) => Church.fromJson(e as Map<String, dynamic>)).toList(),
    addresses: (json['addresses'] as List? ?? []).map((e) => Address.fromJson(e as Map<String, dynamic>)).toList(),
    attendees: (json['attendees'] as List? ?? []).map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
    images: (json['images'] as List? ?? []).map((e) => ResizedImage.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'starting_at': startingAt.toIso8601String(),
    'ending_at': endingAt.toIso8601String(),
    'user_id': userId,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'comments_count': commentsCount,
    'attendees_count': attendeesCount,
    'attending': attending,
    'views_count': viewsCount,
    'viewed': viewed,
    'user': user.toJson(),
    'poster_type': posterType,
    'poster': poster.toJson(),
    'comments': comments.map((e) => e.toJson()).toList(),
    'churches': churches.map((e) => e.toJson()).toList(),
    'addresses': addresses.map((e) => e.toJson()).toList(),
    'attendees': attendees.map((e) => e.toJson()).toList(),
    'images': images.map((e) => e.toJson()).toList()
  };

  Event clone() => Event(
    id: id,
    name: name,
    description: description,
    startingAt: startingAt,
    endingAt: endingAt,
    userId: userId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    commentsCount: commentsCount,
    attendeesCount: attendeesCount,
    attending: attending,
    viewsCount: viewsCount,
    viewed: viewed,
    user: user.clone(),
    posterType: posterType,
    poster: poster.clone(),
    comments: comments.map((e) => e.clone()).toList(),
    churches: churches.map((e) => e.clone()).toList(),
    addresses: addresses.map((e) => e.clone()).toList(),
    attendees: attendees.map((e) => e.clone()).toList(),
    images: images.map((e) => e.clone()).toList()
  );


  Event copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? startingAt,
    DateTime? endingAt,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? commentsCount,
    int? attendeesCount,
    int? attending,
    int? viewsCount,
    int? viewed,
    User? user,
    String? posterType,
    Poster? poster,
    List<Comment>? comments,
    List<Church>? churches,
    List<Address>? addresses,
    List<User>? attendees,
    List<ResizedImage>? images
  }) => Event(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    startingAt: startingAt ?? this.startingAt,
    endingAt: endingAt ?? this.endingAt,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    commentsCount: commentsCount ?? this.commentsCount,
    attendeesCount: attendeesCount ?? this.attendeesCount,
    attending: attending ?? this.attending,
    viewsCount: viewsCount ?? this.viewsCount,
    viewed: viewed ?? this.viewed,
    user: user ?? this.user,
    posterType: posterType ?? this.posterType,
    poster: poster ?? this.poster,
    comments: comments ?? this.comments,
    churches: churches ?? this.churches,
    addresses: addresses ?? this.addresses,
    attendees: attendees ?? this.attendees,
    images: images ?? this.images,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Event && id == other.id && name == other.name && description == other.description && startingAt == other.startingAt && endingAt == other.endingAt && userId == other.userId && createdAt == other.createdAt && updatedAt == other.updatedAt && commentsCount == other.commentsCount && attendeesCount == other.attendeesCount && attending == other.attending && viewsCount == other.viewsCount && viewed == other.viewed && user == other.user && posterType == other.posterType && poster == other.poster && comments == other.comments && churches == other.churches && addresses == other.addresses && attendees == other.attendees && images == other.images;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode ^ startingAt.hashCode ^ endingAt.hashCode ^ userId.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ commentsCount.hashCode ^ attendeesCount.hashCode ^ attending.hashCode ^ viewsCount.hashCode ^ viewed.hashCode ^ user.hashCode ^ posterType.hashCode ^ poster.hashCode ^ comments.hashCode ^ churches.hashCode ^ addresses.hashCode ^ attendees.hashCode ^ images.hashCode;
}
