import 'package:Docdoc/feature/authentication/data/model/auth_response.dart';
import 'package:Docdoc/feature/home/data/model/appointment/data.dart';
import 'package:Docdoc/feature/home/data/model/doctor/doctor.dart';
import 'package:Docdoc/feature/home/data/model/user/user.dart';
import 'package:Docdoc/feature/home/data/model/user/user_response.dart';
import 'package:dartz/dartz.dart';
import 'package:Docdoc/core/error/failure.dart';

abstract class Repository {
  Future<Either<Failure, List<Doctor>>> getDoctor();
  Future<Either<Failure, AuthResponse>> bookingDoctor(
    String date,
    String doctorId,
  );
  Future<Either<Failure, List<Doctor>>> searchDoctor(String name);
  Future<Either<Failure, List<Doctor>>> specializationDoctor(int specialization);
  Future<Either<Failure, UserResponse>> getUser();
  Future<Either<Failure, AuthResponse>> updateUser(User user);
  Future<Either<Failure, List<Data>>> getAppointment();

}
