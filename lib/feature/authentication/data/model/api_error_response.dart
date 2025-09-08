class ApiErrorResponse {
  final String message;
  final Map<String, List<String>> data;
  final bool status;
  final int code;

  ApiErrorResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    final Map<String, List<String>> errors = {};
    if (json['data'] != null) {
      json['data'].forEach((key, value) {
        errors[key] = List<String>.from(value.map((e) => e.toString()));
      });
    }

    return ApiErrorResponse(
      message: json['message'] ?? '',
      data: errors,
      status: json['status'] ?? false,
      code: json['code'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {"message": message, "data": data, "status": status, "code": code};
  }

  /// Helper: return all errors in one string
  String getAllErrorsAsString() {
    return data.values.expand((list) => list).join("\n");
  }

  /// Helper: return error for a specific field
  String? getErrorForField(String field) {
    return data[field]?.join(", ");
  }
}
