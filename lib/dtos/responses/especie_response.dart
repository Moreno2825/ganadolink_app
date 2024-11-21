import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:ganadolink_app/dtos/requests/especie.dart';
import 'package:ganadolink_app/utils/constant.dart';

// local
Future<List<Especie>> loadEspecies() async {
  // Lee el archivo JSON desde la carpeta assets
  final String response = await rootBundle.loadString('assets/json/especie/especie_get_all.json');

  final data = json.decode(response);

  // Mapea la lista de especies a una lista de objetos Especie
  return (data['especies'] as List).map((item) => Especie.fromJson(item)).toList();
}

// ws
Future<List<Especie>> fetchEspecies() async {
  final response = await http.get(Uri.parse('${ws}especies'));

  try {
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['especies'];
      return data.map((json) => Especie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load especies');
    }
  } catch (e) {
    throw Exception('Failed to load especies $e');
  }
}

