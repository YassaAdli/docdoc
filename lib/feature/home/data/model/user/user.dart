class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  User({this.id, this.name, this.email, this.phone, this.gender});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    gender: json['gender'] as String?,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (email != null) data['email'] = email;
    if (phone != null) data['phone'] = phone;
    if (gender != null) {
      if (gender == 'male') {
        data['gender'] = '0';
      } else if (gender == 'female') {
        data['gender'] = '1';
      } else {
        data['gender'] = gender;
      }
    }
    return data;
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phone: $phone, gender: $gender}';
  }
}
