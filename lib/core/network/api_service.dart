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
    final fullUrl = '$_baseUrl$endPoint';
    debugPrint(
      'Request URL----------------------------------------------------------: $fullUrl',
    );

    var response = await _dio.get(
      '$_baseUrl$endPoint',
      queryParameters: query,
      options: Options(headers: headers),
    );
    debugPrint('✅ Response [${response.statusCode}] from $fullUrl');
    debugPrint('🔸 Response headers: ${response.headers.map}');
    debugPrint('🔸 Response body: ${response.data}');
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    final fullUrl = '$_baseUrl$endPoint';
    debugPrint('🟠 [POST] $fullUrl');
    debugPrint('🔹 Headers: $headers');
    debugPrint('🔹 Body: $body');

    try {
      final response = await _dio.post(
        fullUrl,
        queryParameters: query,
        data: body,
        options: Options(headers: headers),
      );

      debugPrint('✅ Response [${response.statusCode}]: ${response.data}');
      return Map<String, dynamic>.from(response.data);
    } on DioException catch (e) {
      debugPrint('❌ API Error → ${e.response?.statusCode}');
      debugPrint('❌ Response body → ${e.response?.data}');
      rethrow;
    }
  }

}
