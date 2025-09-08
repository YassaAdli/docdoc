import 'package:Docdoc/feature/home/data/model/appointment/data.dart';
class Appointment {
	String? message;
	List<Data>? data;
	bool? status;
	int? code;

	Appointment({this.message, this.data, this.status, this.code});

	factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
				message: json['message'] as String?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => Data.fromJson(e as Map<String, dynamic>))
						.toList(),
				status: json['status'] as bool?,
				code: json['code'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.map((e) => e.toJson()).toList(),
				'status': status,
				'code': code,
			};
}


