import 'package:equatable/equatable.dart';

import 'city.dart';
import 'specialization.dart';

class Doctor extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? gender;
  final String? address;
  final String? description;
  final String? degree;
  final Specialization? specialization;
  final City? city;
  final int? appointPrice;
  final String? startTime;
  final String? endTime;

  const Doctor({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    photo: json['photo'] as String?,
    gender: json['gender'] as String?,
    address: json['address'] as String?,
    description: json['description'] as String?,
    degree: json['degree'] as String?,
    specialization: json['specialization'] == null
        ? null
        : Specialization.fromJson(
            json['specialization'] as Map<String, dynamic>,
          ),
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
    appointPrice: json['appoint_price'] as int?,
    startTime: json['start_time'] as String?,
    endTime: json['end_time'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'photo': photo,
    'gender': gender,
    'address': address,
    'description': description,
    'degree': degree,
    'specialization': specialization?.toJson(),
    'city': city?.toJson(),
    'appoint_price': appointPrice,
    'start_time': startTime,
    'end_time': endTime,
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      photo,
      gender,
      address,
      description,
      degree,
      specialization,
      city,
      appointPrice,
      startTime,
      endTime,
    ];
  }
}
