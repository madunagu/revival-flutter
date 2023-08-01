import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class VideoPost {

  const VideoPost({
    required this.id,
    required this.name,
    required this.srcUrl,
    required this.fullText,
    required this.description,
    required this.authorId,
    required this.uploaderId,
    required this.size,
    required this.length,
    required this.language,
    required this.createdAt,
    required this.updatedAt,
    required this.commentsCount,
    required this.likesCount,
    required this.liked,
    required this.viewsCount,
    required this.viewed,
    required this.comments,
    required this.author,
    required this.user,
    required this.churches,
    required this.images,
    required this.addresses,
  });

  final int id;
  final String name;
  final String srcUrl;
  final String fullText;
  final String description;
  final int authorId;
  final int uploaderId;
  final int size;
  final int length;
  final String language;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int commentsCount;
  final int likesCount;
  final int liked;
  final int viewsCount;
  final int viewed;
  final List<Comment> comments;
  final User author;
  final User user;
  final List<Church> churches;
  final List<ResizedImage> images;
  final List<Address> addresses;

  factory VideoPost.fromJson(Map<String,dynamic> json) => VideoPost(
    id: json['id'] as int,
    name: json['name'].toString(),
    srcUrl: json['src_url'].toString(),
    fullText: json['full_text'].toString(),
    description: json['description'].toString(),
    authorId: json['author_id'] as int,
    uploaderId: json['uploader_id'] as int,
    size: json['size'] as int,
    length: json['length'] as int,
    language: json['language'].toString(),
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    commentsCount: json['comments_count'] as int,
    likesCount: json['likes_count'] as int,
    liked: json['liked'] as int,
    viewsCount: json['views_count'] as int,
    viewed: json['viewed'] as int,
    comments: (json['comments'] as List? ?? []).map((e) => Comment.fromJson(e as Map<String, dynamic>)).toList(),
    author: User.fromJson(json['author'] as Map<String, dynamic>),
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    churches: (json['churches'] as List? ?? []).map((e) => Church.fromJson(e as Map<String, dynamic>)).toList(),
    images: (json['images'] as List? ?? []).map((e) => ResizedImage.fromJson(e as Map<String, dynamic>)).toList(),
    addresses: (json['addresses'] as List? ?? []).map((e) => Address.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'src_url': srcUrl,
    'full_text': fullText,
    'description': description,
    'author_id': authorId,
    'uploader_id': uploaderId,
    'size': size,
    'length': length,
    'language': language,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'comments_count': commentsCount,
    'likes_count': likesCount,
    'liked': liked,
    'views_count': viewsCount,
    'viewed': viewed,
    'comments': comments.map((e) => e.toJson()).toList(),
    'author': author.toJson(),
    'user': user.toJson(),
    'churches': churches.map((e) => e.toJson()).toList(),
    'images': images.map((e) => e.toJson()).toList(),
    'addresses': addresses.map((e) => e.toJson()).toList()
  };

  VideoPost clone() => VideoPost(
    id: id,
    name: name,
    srcUrl: srcUrl,
    fullText: fullText,
    description: description,
    authorId: authorId,
    uploaderId: uploaderId,
    size: size,
    length: length,
    language: language,
    createdAt: createdAt,
    updatedAt: updatedAt,
    commentsCount: commentsCount,
    likesCount: likesCount,
    liked: liked,
    viewsCount: viewsCount,
    viewed: viewed,
    comments: comments.map((e) => e.clone()).toList(),
    author: author.clone(),
    user: user.clone(),
    churches: churches.map((e) => e.clone()).toList(),
    images: images.map((e) => e.clone()).toList(),
    addresses: addresses.map((e) => e.clone()).toList()
  );


  VideoPost copyWith({
    int? id,
    String? name,
    String? srcUrl,
    String? fullText,
    String? description,
    int? authorId,
    int? uploaderId,
    int? size,
    int? length,
    String? language,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? commentsCount,
    int? likesCount,
    int? liked,
    int? viewsCount,
    int? viewed,
    List<Comment>? comments,
    User? author,
    User? user,
    List<Church>? churches,
    List<ResizedImage>? images,
    List<Address>? addresses
  }) => VideoPost(
    id: id ?? this.id,
    name: name ?? this.name,
    srcUrl: srcUrl ?? this.srcUrl,
    fullText: fullText ?? this.fullText,
    description: description ?? this.description,
    authorId: authorId ?? this.authorId,
    uploaderId: uploaderId ?? this.uploaderId,
    size: size ?? this.size,
    length: length ?? this.length,
    language: language ?? this.language,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    commentsCount: commentsCount ?? this.commentsCount,
    likesCount: likesCount ?? this.likesCount,
    liked: liked ?? this.liked,
    viewsCount: viewsCount ?? this.viewsCount,
    viewed: viewed ?? this.viewed,
    comments: comments ?? this.comments,
    author: author ?? this.author,
    user: user ?? this.user,
    churches: churches ?? this.churches,
    images: images ?? this.images,
    addresses: addresses ?? this.addresses,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is VideoPost && id == other.id && name == other.name && srcUrl == other.srcUrl && fullText == other.fullText && description == other.description && authorId == other.authorId && uploaderId == other.uploaderId && size == other.size && length == other.length && language == other.language && createdAt == other.createdAt && updatedAt == other.updatedAt && commentsCount == other.commentsCount && likesCount == other.likesCount && liked == other.liked && viewsCount == other.viewsCount && viewed == other.viewed && comments == other.comments && author == other.author && user == other.user && churches == other.churches && images == other.images && addresses == other.addresses;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ srcUrl.hashCode ^ fullText.hashCode ^ description.hashCode ^ authorId.hashCode ^ uploaderId.hashCode ^ size.hashCode ^ length.hashCode ^ language.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ commentsCount.hashCode ^ likesCount.hashCode ^ liked.hashCode ^ viewsCount.hashCode ^ viewed.hashCode ^ comments.hashCode ^ author.hashCode ^ user.hashCode ^ churches.hashCode ^ images.hashCode ^ addresses.hashCode;
}
