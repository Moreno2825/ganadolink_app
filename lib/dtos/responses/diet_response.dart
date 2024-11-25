import 'dart:convert';
import 'package:ganadolink_app/dtos/requests/diet.dart';
import 'package:http/http.dart' as http;
import 'package:ganadolink_app/utils/constant.dart';

///! --------------------------------------------------------------------------
///! Get all diets
///! --------------------------------------------------------------------------
Future<List<Diet>> fetchDiet() async {
  final response = await http.get(Uri.parse('${ws}diet'));

  try {
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['diets'];
      return data.map((json) => Diet.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load diets');
    }
  } catch (e) {
    throw Exception('Failed to load diets $e');
  }
}

///! --------------------------------------------------------------------------
///! Create diets
///! --------------------------------------------------------------------------
Future<void> createDiet(Map<String, dynamic> dietData) async {
  final url = Uri.parse('${ws}diet/create');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(dietData),
    );

    if (response.statusCode == 201) {
      // La dieta se creó correctamente
      print('Dieta creada exitosamente');
    } else {
      // Algo salió mal
      throw Exception('Failed to create diet: ${response.body}');
    }
  } catch (e) {
    // Manejo del error
    throw Exception('Failed to create diet: $e');
  }
}

///! --------------------------------------------------------------------------
///! Update diet
///! --------------------------------------------------------------------------
Future<void> updateDiet(String id, Map<String, dynamic> updatedData) async {
  final url = Uri.parse('${ws}diet/put/$id'); // Asegúrate de que tu endpoint coincida con esta estructura

  try {
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedData),
    );

    if (response.statusCode == 200) {
      // La dieta se actualizó correctamente
      print('Dieta actualizada exitosamente');
    } else {
      // Algo salió mal
      throw Exception('Failed to update diet: ${response.body}');
    }
  } catch (e) {
    // Manejo del error
    throw Exception('Failed to update diet: $e');
  }
}

///! --------------------------------------------------------------------------
///! Eliminar diets
///! --------------------------------------------------------------------------
Future<void> deleteDiet(String id) async {
  final url = Uri.parse('${ws}diet/delete/$id');

  try {
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      // La dieta se eliminó correctamente
      print('Dieta eliminada exitosamente');
    } else {
      // Algo salió mal
      throw Exception('Failed to delete diet: ${response.body}');
    }
  } catch (e) {
    // Manejo del error
    throw Exception('Failed to delete diet: $e');
  }
}


