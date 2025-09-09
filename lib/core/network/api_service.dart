import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiService {
  final _baseUrl = 'https://vcare.integration25.com/api';
  final Dio _dio;
  ApiService(this._dio);
  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {


    var response = await _dio.get(
      '$_baseUrl$endPoint',
      queryParameters: query,
      options: Options(headers: headers),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl$endPoint',
        queryParameters: query,
        data: body,
        options: Options(headers: headers),
      );

      return Map<String, dynamic>.from(response.data);
    } on DioException catch (e) {
      debugPrint(' API Error → ${e.response?.statusCode}');
      debugPrint(' Response body → ${e.response?.data}');
      rethrow;
    }
  }

}
