import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';

import 'patient.dart';

class Data {
	int? id;
	Doctor? doctor;
	Patient? patient;
	String? appointmentTime;
	String? appointmentEndTime;
	String? status;
	String? notes;
	int? appointmentPrice;

	Data({
		this.id, 
		this.doctor, 
		this.patient, 
		this.appointmentTime, 
		this.appointmentEndTime, 
		this.status, 
		this.notes, 
		this.appointmentPrice, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				id: json['id'] as int?,
				doctor: json['doctor'] == null
						? null
						: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
				patient: json['patient'] == null
						? null
						: Patient.fromJson(json['patient'] as Map<String, dynamic>),
				appointmentTime: json['appointment_time'] as String?,
				appointmentEndTime: json['appointment_end_time'] as String?,
				status: json['status'] as String?,
				notes: json['notes'] as String?,
				appointmentPrice: json['appointment_price'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'doctor': doctor?.toJson(),
				'patient': patient?.toJson(),
				'appointment_time': appointmentTime,
				'appointment_end_time': appointmentEndTime,
				'status': status,
				'notes': notes,
				'appointment_price': appointmentPrice,
			};
}
