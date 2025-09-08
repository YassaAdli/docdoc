import 'package:equatable/equatable.dart';

class Governrate extends Equatable {
  final int? id;
  final String? name;

  const Governrate({this.id, this.name});

  factory Governrate.fromJson(Map<String, dynamic> json) =>
      Governrate(id: json['id'] as int?, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  @override
  List<Object?> get props => [id, name];
}
