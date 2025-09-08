import 'package:Docdoc/feature/authentication/data/model/auth_response.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final AuthResponse response;
  LoginSuccess(this.response);
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
class AuthRemembered extends LoginState {
  final String email;
  final String password;

  AuthRemembered(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}