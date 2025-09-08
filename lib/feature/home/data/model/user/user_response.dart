import 'package:Docdoc/feature/home/data/model/user/user.dart';
class UserResponse {
  String? message;
  List<User>? data;
  bool? status;
  int? code;

  UserResponse({this.message, this.data, this.status, this.code});

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse (
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
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
