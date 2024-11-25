// ignore_for_file: non_constant_identifier_names

class Ganado {
  final String sexo;
  final String raza;
  final String color;
  final double peso;
  final String siniiga;
  final bool b_eliminar;

  Ganado({
    required this.sexo,
    required this.raza,
    required this.color,
    required this.peso,
    required this.siniiga,
    required this.b_eliminar,
  });

  factory Ganado.fromJson(Map<String, dynamic> json) {
    return Ganado(
      sexo: json['sexo'] ?? '',
      raza: json['raza'] ?? '',
      color: json['color'] ?? '',
      peso: double.tryParse(json['peso']) ?? 0.0,
      siniiga: json['siniiga'] ?? '',
      b_eliminar: json['b_eliminar'] ?? false,
    );
  }
}