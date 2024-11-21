// ignore_for_file: non_constant_identifier_names

class Raza {
  final String _id;
  final String name;
  final bool b_activo;

  Raza({required String id, required this.name, required this.b_activo}) : _id = id;

  factory Raza.fromJson(Map<String, dynamic> json) {
    return Raza(
      id: json['_id'],
      name: json['name'],
      b_activo: json['b_activo'],
    );
  }

  String get id => _id;
}
