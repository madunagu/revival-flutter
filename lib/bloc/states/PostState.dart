import 'package:devotion/models/event.dart';
import 'package:devotion/models/feed.dart';
import 'package:devotion/models/pagination.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostFailure extends PostState {}

class PostSuccess extends PostState {
  final List<Feed> posts;
  final int currentPage;
  final int totalPages;

  const PostSuccess({
    required this.posts,
    required this.currentPage,
    required this.totalPages,
  });

  PostSuccess copyWith({
    List<Feed>? posts,
    int? totalPages,
    int? currentPage,
  }) {
    return PostSuccess(
      posts: posts ?? this.posts,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object> get props => [
        posts,
        currentPage,
        totalPages,
      ];

  @override
  String toString() =>
      'PostSuccess { posts: ${posts.length}, total Pages: $totalPages ,Current Pages $currentPage}';
}
