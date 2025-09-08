import 'package:equatable/equatable.dart';

import 'governrate.dart';

class City extends Equatable {
  final int? id;
  final String? name;
  final Governrate? governrate;

  const City({this.id, this.name, this.governrate});

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json['id'] as int?,
    name: json['name'] as String?,
    governrate: json['governrate'] == null
        ? null
        : Governrate.fromJson(json['governrate'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'governrate': governrate?.toJson(),
  };

  @override
  List<Object?> get props => [id, name, governrate];
}
