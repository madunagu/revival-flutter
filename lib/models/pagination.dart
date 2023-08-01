import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Pagination {

  const Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
  });

  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;

  factory Pagination.fromJson(Map<String,dynamic> json) => Pagination(
    total: json['total'] as int,
    count: json['count'] as int,
    perPage: json['per_page'] as int,
    currentPage: json['current_page'] as int,
    totalPages: json['total_pages'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'total': total,
    'count': count,
    'per_page': perPage,
    'current_page': currentPage,
    'total_pages': totalPages
  };

  Pagination clone() => Pagination(
    total: total,
    count: count,
    perPage: perPage,
    currentPage: currentPage,
    totalPages: totalPages
  );


  Pagination copyWith({
    int? total,
    int? count,
    int? perPage,
    int? currentPage,
    int? totalPages
  }) => Pagination(
    total: total ?? this.total,
    count: count ?? this.count,
    perPage: perPage ?? this.perPage,
    currentPage: currentPage ?? this.currentPage,
    totalPages: totalPages ?? this.totalPages,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Pagination && total == other.total && count == other.count && perPage == other.perPage && currentPage == other.currentPage && totalPages == other.totalPages;

  @override
  int get hashCode => total.hashCode ^ count.hashCode ^ perPage.hashCode ^ currentPage.hashCode ^ totalPages.hashCode;
}
