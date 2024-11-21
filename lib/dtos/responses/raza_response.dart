import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ganadolink_app/utils/constant.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ganadolink_app/dtos/requests/raza.dart';

Future<List<Raza>> loadRazas() async {
  // Lee el archivo JSON desde la carpeta assets
  final String response = await rootBundle.loadString('assets/json/raza/raza_get_all.json');

  final data = json.decode(response);

  // Mapea la lista de especies a una lista de objetos Especie
  return (data['razas'] as List).map((item) => Raza.fromJson(item)).toList();
}

// ws
Future<List<Raza>> fetchRazas() async {
  final response = await http.get(Uri.parse('${ws}razas'));

  try {
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['razas'];
      return data.map((json) => Raza.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load razas');
    }
  } catch (e) {
    throw Exception('Failed to load razas $e');
  }
}
