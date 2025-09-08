import 'package:Docdoc/core/utils/secure_service.dart';
import 'package:Docdoc/feature/authentication/data/model/auth_response.dart';
import 'package:Docdoc/feature/home/data/model/appointment/appointment.dart';
import 'package:Docdoc/feature/home/data/model/appointment/data.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/data/model/user/user.dart';
import 'package:Docdoc/feature/home/data/model/user/user_response.dart';
import 'package:Docdoc/feature/home/data/repositories/repository.dart';
import 'package:Docdoc/feature/home/screens/book_appointment/widget/appointment_type_selector.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:Docdoc/core/error/failure.dart';
import 'package:Docdoc/core/network/api_service.dart';
import 'package:flutter/cupertino.dart';

class RepositoryImpl implements Repository {
  final ApiService api;

  RepositoryImpl(this.api);

  @override
  Future<Either<Failure, List<Doctor>>> getDoctor() async {
    final token = await SecureStorage().getToken();
    try {
      final response = await api.get(
        endPoint: "/doctor/index",
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      List<Doctor> doctor = [];
      for (var element in response['data']) {
        try {
          doctor.add(Doctor.fromJson(element));
        } on Exception catch (e) {
          debugPrint(e.toString());
        }
      }
      return right(doctor);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> bookingDoctor(
    String date,
    String doctorId,
  ) async {
    final token = await SecureStorage().getToken();
    try {
      final response = await api.post(
        endPoint: "/appointment/store",
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {"doctor_id": doctorId, "start_time": date},
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
  Future<Either<Failure, List<Doctor>>> searchDoctor(String name) async {
    final token = await SecureStorage().getToken();
    try {
      final response = await api.get(
        endPoint: "/doctor/doctor-search",
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        query: {"name": name},
      );
      List<Doctor> doctor = [];
      for (var element in response['data']) {
        try {
          doctor.add(Doctor.fromJson(element));
        } on Exception catch (e) {
          debugPrint(e.toString());
        }
      }
      return right(doctor);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Doctor>>> specializationDoctor(
    int specialization,
  ) async {
    final token = await SecureStorage().getToken();
    try {
      final response = await api.get(
        endPoint: "/specialization/show/$specialization",
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      List<Doctor> doctor = [];
      for (var element in response['data']["doctors"]) {
        try {
          doctor.add(Doctor.fromJson(element));
        } on Exception catch (e) {
          debugPrint(e.toString());
        }
      }
      return right(doctor);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserResponse>> getUser() async {
    final token = await SecureStorage().getToken();
    try {
      final response = await api.get(
        endPoint: '/user/profile',
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      final res = UserResponse.fromJson(response);
      return right(res);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> updateUser(User user) async {
    final token = await SecureStorage().getToken();
    try {
      final response = await api.post(
        endPoint: '/user/update',
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: user.toJson(),
      );

      final res = AuthResponse.fromJson(response);
      return right(res);
        } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure("Error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<Data>>> getAppointment()async {
    final token = await SecureStorage().getToken();
    try {
      final response = await api.get(
        endPoint: '/appointment/index',
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      List<Data> appointment = [];
      for (var element in response['data']) {
        try {
          appointment.add(Data.fromJson(element));
        } on Exception catch (e) {
          debugPrint(e.toString());
        }
      }
      return right(appointment);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}
