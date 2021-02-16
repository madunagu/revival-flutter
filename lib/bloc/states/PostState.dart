import 'package:devotion/models/Event.dart';
import 'package:devotion/models/Feed.dart';
import 'package:devotion/models/Pagination.dart';
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
  final Pagination pagination;

  const PostSuccess({
    this.posts,
    this.pagination,
  });

  PostSuccess copyWith({
    List<dynamic> posts,
    bool hasReachedMax,
  }) {
    return PostSuccess(
      posts: posts ?? this.posts,
      pagination: pagination ?? this.pagination,
    );
  }

  @override
  List<Object> get props => [posts, pagination];

  @override
  String toString() =>
      'PostSuccess { posts: ${posts.length}, pagination: ${pagination.toString()}';
}
