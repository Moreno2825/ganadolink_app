// ignore_for_file: non_constant_identifier_names

class Especie {
  final String _id;
  final String name;
  final bool b_activo;

  Especie({required String id, required this.name, required this.b_activo}) : _id = id;

  factory Especie.fromJson(Map<String, dynamic> json) {
    return Especie(
      id: json['_id'],
      name: json['name'],
      b_activo: json['b_activo'],
    );
  }

  String get id => _id;
}
