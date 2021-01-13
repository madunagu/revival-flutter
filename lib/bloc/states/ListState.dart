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
  final bool hasReachedMax;
  final int currentPage;

  const ListSuccess({
    this.models,
    this.hasReachedMax,
    this.currentPage,
  });

  ListSuccess copyWith({
    List<dynamic> models,
    bool hasReachedMax,
    int currentPage,
  }) {
    return ListSuccess(
      models: models ?? this.models,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [models, hasReachedMax, currentPage];

  @override
  String toString() =>
      'ListSuccess { Lists: ${models.length}, hasReachedMax: $hasReachedMax, currentPage: $currentPage }';
}
