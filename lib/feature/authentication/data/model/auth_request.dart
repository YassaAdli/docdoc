class AuthRequest {
  final String email;
  final String password;
  final String? name;
  final String? phone;
  final String? gender;
  final String? passwordConfirmation;

  AuthRequest({
    required this.email,
    required this.password,
    this.name,
    this.phone,
    this.gender,
    this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      if (name != null) "name": name,
      if (phone != null) "phone": phone,
      if (gender != null) "gender": gender,
      if (passwordConfirmation != null)
        "password_confirmation": passwordConfirmation,
    };
  }
}
