class AuthResponse {
  final String message;
  final AuthData? data;
  final bool status;
  final int code;

  AuthResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json["message"] ?? "",
      data: (json["data"] is Map<String, dynamic>)
          ? AuthData.fromJson(json["data"])
          : null,
      status: json["status"] ?? false,
      code: json["code"] ?? 0,
    );
  }
}

class AuthData {
  final String token;
  final String username;

  AuthData({required this.token, required this.username});

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      token: json["token"] ?? "",
      username: json["username"] ?? "",
    );
  }
}
