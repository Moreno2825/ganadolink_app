// ignore_for_file: non_constant_identifier_names

class Motivo {
  final String _id;
  final String name;
  final bool b_activo;

  Motivo({required String id, required this.name, required this.b_activo}) : _id = id;

  factory Motivo.fromJson(Map<String, dynamic> json) {
    return Motivo(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      b_activo: json['b_activo'] ?? false,
    );
  }

  String get id => _id;
}