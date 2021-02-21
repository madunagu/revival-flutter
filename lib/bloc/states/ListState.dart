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
  final int currentPage;
  final int totalPages;

  const ListSuccess({
    this.models,
    this.currentPage,
    this.totalPages,
  });

  ListSuccess copyWith({
    List<dynamic> models,
    int totalPages,
    int currentPage,
  }) {
    return ListSuccess(
      models: models ?? this.models,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object> get props => [
        models,
        currentPage,
        totalPages,
      ];

  @override
  String toString() =>
      'ListSuccess { Lists: ${models.length}, total Pages: $totalPages ,Current Pages $currentPage }';
}
