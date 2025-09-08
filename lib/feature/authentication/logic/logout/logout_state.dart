import 'package:Docdoc/feature/authentication/data/model/auth_response.dart';

abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final AuthResponse response;
  LogoutSuccess(this.response);
}

class LogoutFailure extends LogoutState {
  final String message;
  LogoutFailure(this.message);
}
