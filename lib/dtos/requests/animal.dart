// ignore_for_file: non_constant_identifier_names

class Animal {
  final int id;
  final String nombre;
  final bool b_Activo;
  final int id_especie;
  final int id_raza;
  final double peso;
  final String sexo;
  final String color;

  Animal({
    required this.id_especie,
    required this.id_raza,
    required this.peso,
    required this.sexo,
    required this.color,
    required this.id,
    required this.nombre,
    required this.b_Activo,
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id_especie: json['id_especie'],
      id_raza: json['id_raza'],
      peso: json['peso'],
      sexo: json['sexo'],
      color: json['color'],
      id: json['id'],
      nombre: json['nombre'],
      b_Activo: json['b_Activo'],
    );
  }
}
