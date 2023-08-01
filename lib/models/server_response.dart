import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class ServerResponse {

  const ServerResponse({
    required this.data,
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
  });

  final List<String> data;
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;

  factory ServerResponse.fromJson(Map<String,dynamic> json) => ServerResponse(
    data: (json['data'] as List? ?? []).map((e) => e as String).toList(),
    total: json['total'] as int,
    count: json['count'] as int,
    perPage: json['per_page'] as int,
    currentPage: json['current_page'] as int,
    totalPages: json['total_pages'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'data': data.map((e) => e.toString()).toList(),
    'total': total,
    'count': count,
    'per_page': perPage,
    'current_page': currentPage,
    'total_pages': totalPages
  };

  ServerResponse clone() => ServerResponse(
    data: data.toList(),
    total: total,
    count: count,
    perPage: perPage,
    currentPage: currentPage,
    totalPages: totalPages
  );


  ServerResponse copyWith({
    List<String>? data,
    int? total,
    int? count,
    int? perPage,
    int? currentPage,
    int? totalPages
  }) => ServerResponse(
    data: data ?? this.data,
    total: total ?? this.total,
    count: count ?? this.count,
    perPage: perPage ?? this.perPage,
    currentPage: currentPage ?? this.currentPage,
    totalPages: totalPages ?? this.totalPages,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ServerResponse && data == other.data && total == other.total && count == other.count && perPage == other.perPage && currentPage == other.currentPage && totalPages == other.totalPages;

  @override
  int get hashCode => data.hashCode ^ total.hashCode ^ count.hashCode ^ perPage.hashCode ^ currentPage.hashCode ^ totalPages.hashCode;
}
