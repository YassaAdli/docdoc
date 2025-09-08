import 'dart:io';
import 'package:dio/dio.dart';

abstract class Failure {
  final String errMassage;

  const Failure(this.errMassage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMassage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(' bad Certificate Timeout');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode ?? 500,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled');
      case DioExceptionType.connectionError:
        if (dioError.error is SocketException) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Connection Error');
        }
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure(dioError.message ?? 'Unexpected Error');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    try {
      final String apiMessage = response is Map<String, dynamic>
          ? (response['message']?.toString() ?? '')
          : response.toString();

      if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        return ServerFailure(
          apiMessage.isNotEmpty
              ? apiMessage
              : 'Unauthorized request, please check your email and password.',
        );
      } else if (statusCode == 404) {
        return ServerFailure('Not Found, please try later');
      } else if (statusCode == 500) {
        return ServerFailure('Internal Server Error, please try later');
      } else {
        return ServerFailure(
          apiMessage.isNotEmpty
              ? apiMessage
              : 'Ops something went wrong, please try again later',
        );
      }
    } catch (e) {
      return ServerFailure('Unexpected error: ${e.toString()}');
    }
  }
}
