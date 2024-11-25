import 'package:ganadolink_app/dtos/requests/motivo.dart';
import 'package:ganadolink_app/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// ws

Future<List<Motivo>> fetchMotivos() async {
  final response = await http.get(Uri.parse('${ws}motivos'));

  try {
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['motivos'];
      return data.map((json) => Motivo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load motivos');
    }
  } catch (e) {
    throw Exception('Failed to load motivos $e');
  }
}