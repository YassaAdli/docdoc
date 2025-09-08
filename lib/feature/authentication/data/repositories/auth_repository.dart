import 'package:dartz/dartz.dart';
import 'package:Docdoc/core/error/failure.dart';
import 'package:Docdoc/feature/authentication/data/model/auth_request.dart';
import 'package:Docdoc/feature/authentication/data/model/auth_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login(AuthRequest request);
  Future<Either<Failure, AuthResponse>> register(AuthRequest request);
  Future<Either<Failure, AuthResponse>> logout();
  Future<void> saveCredentials(String email, String password);
  Future<Map<String, String>?> getCredentials();
  Future<void> clearCredentials();
}
