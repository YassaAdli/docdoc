import 'package:Docdoc/feature/authentication/data/model/auth_response.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final AuthResponse response;
  RegisterSuccess(this.response);
}

class RegisterFailure extends RegisterState {
  final String message;
  RegisterFailure(this.message);
}
