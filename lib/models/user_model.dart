class UserModel {
  final int id;
  final String name;
  String? email;
  String? password;
  String? role;
  String? avatar;

  UserModel({
    required this.id,
    required this.name,
    this.email,
    this.password,
    this.role,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }
}
