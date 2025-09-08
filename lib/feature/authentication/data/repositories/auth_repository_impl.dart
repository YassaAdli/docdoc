import 'package:Docdoc/core/utils/secure_service.dart';
import 'package:Docdoc/feature/authentication/data/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:Docdoc/core/error/failure.dart';
import 'package:Docdoc/core/network/api_service.dart';
import 'package:Docdoc/feature/authentication/data/model/auth_request.dart';
import 'package:Docdoc/feature/authentication/data/model/auth_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService api;
  final SecureStorage secureStorage;

  AuthRepositoryImpl(this.api, this.secureStorage);

  @override
  Future<Either<Failure, AuthResponse>> login(AuthRequest request) async {
    try {
      final response = await api.post(
        endPoint: "/auth/login",
        body: request.toJson(),
      );
      final res = AuthResponse.fromJson(response);
      return right(res);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register(AuthRequest request) async {
    try {
      final response = await api.post(
        endPoint: "/auth/register",
        body: request.toJson(),
      );
      final res = AuthResponse.fromJson(response);
      debugPrint(res.message);
      return right(res);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> logout() async {
    final token = await SecureStorage().getToken();
    try {
      final response = await api.post(
        endPoint: "/auth/logout",
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {},
      );
      final res = AuthResponse.fromJson(response);
      debugPrint(res.message);
      return right(res);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> saveCredentials(String email, String password) async {
    await secureStorage.saveCredentials(email, password);
  }

  @override
  Future<Map<String, String>?> getCredentials() async {
    final creds = await secureStorage.getCredentials();

    final email = creds['email'];
    final password = creds['password'];

    if (email != null && password != null) {
      return {
        "email": email,
        "password": password,
      };
    }
    return null;
  }

  @override
  Future<void> clearCredentials() async {
    await secureStorage.clearCredentials();

  }
}
