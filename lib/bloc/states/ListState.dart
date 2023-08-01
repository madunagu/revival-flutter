import 'package:devotion/models/model.dart';
import 'package:devotion/models/pagination.dart';
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
    required this.models,
    required this.currentPage,
    required this.totalPages,
  });

  ListSuccess copyWith({
    required List<Model> models,
    required int totalPages,
    required int currentPage,
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
