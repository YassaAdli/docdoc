class ValidationErrorResponse {
  final String? message;
  final Map<String, List<String>> errors;
  final bool status;
  final int code;

  ValidationErrorResponse({
    this.message,
    required this.errors,
    required this.status,
    required this.code,
  });

  factory ValidationErrorResponse.fromJson(Map<String, dynamic> json) {
    final Map<String, List<String>> parsedErrors = {};
    if (json['data'] != null) {
      (json['data'] as Map<String, dynamic>).forEach((key, value) {
        parsedErrors[key] = List<String>.from(value);
      });
    }
    return ValidationErrorResponse(
      message: json['message'],
      errors: parsedErrors,
      status: json['status'] ?? false,
      code: json['code'] ?? 0,
    );
  }
}
