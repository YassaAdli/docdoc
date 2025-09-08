import 'package:equatable/equatable.dart';

class Specialization extends Equatable {
  final int? id;
  final String? name;

  const Specialization({this.id, this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  @override
  List<Object?> get props => [id, name];
}
