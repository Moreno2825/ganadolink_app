// ignore_for_file: non_constant_identifier_names

import 'package:ganadolink_app/dtos/requests/dieta.dart';
import 'package:ganadolink_app/dtos/requests/especie.dart';
import 'package:ganadolink_app/dtos/requests/ganado.dart';
import 'package:ganadolink_app/dtos/requests/motivo.dart';
import 'package:ganadolink_app/dtos/requests/user.dart';

class Diet {
  final String _id;
  final User? user;
  final bool b_activo;
  final Especie? especie;
  final Motivo? motivo;
  final Ganado? ganado;
  final Dieta? dieta;

  Diet({
    required String id,
    required this.user,
    required this.especie,
    required this.motivo,
    required this.ganado,
    required this.dieta,
    required this.b_activo,
  }) : _id = id;

  factory Diet.fromJson(Map<String, dynamic> json) {
    return Diet(
      id: json['_id'] ?? '',
      user: json['user'] == null ? null : User.fromJson(json['user']),
      especie: json['especie'] == null ? null : Especie.fromJson(json['especie']),
      motivo: json['motivo'] == null ? null : Motivo.fromJson(json['motivo']),
      ganado: json['ganado'] == null ? null : Ganado.fromJson(json['ganado']),
      dieta: json['dieta'] == null ? null : Dieta.fromJson(json['dieta']),
      b_activo: json['b_activo'] ?? false,
    );
  }

  String get id => _id;
}
