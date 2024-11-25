// ignore_for_file: non_constant_identifier_names

class User {
  final String _id;
  final String name;
  final String email;

  User({
    required String id,
    required this.name,
    required this.email,
  }) : _id = id;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  String get id => _id;
}
