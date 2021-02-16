import 'package:devotion/models/Pagination.dart';
import 'package:equatable/equatable.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class ListInitial extends ListState {}

class ListFailure extends ListState {}

class ListSuccess extends ListState {
  final List<dynamic> models;
  final Pagination pagination;

  const ListSuccess({
    this.models,
    this.pagination,
  });

  ListSuccess copyWith({
    List<dynamic> models,
    bool hasReachedMax,
    int currentPage,
  }) {
    return ListSuccess(
      models: models ?? this.models,
      pagination: hasReachedMax ?? this.pagination,
    );
  }

  @override
  List<Object> get props => [
        models,
        pagination,
      ];

  @override
  String toString() =>
      'ListSuccess { Lists: ${models.length}, pagination: $pagination.currentPage }';
}
