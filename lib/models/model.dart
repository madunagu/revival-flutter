import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

@immutable
class Model {
  const Model(
    this.id,
  );

  final int id;

  factory Model.fromJson(Map<String, dynamic> json) => Model(json['id'] as int);

  Map<String, dynamic> toJson() => {'id': id};

  Model clone() => Model(id);


  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Model && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
