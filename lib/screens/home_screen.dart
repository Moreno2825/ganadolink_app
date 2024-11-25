import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ganadolink_app/dtos/requests/diet.dart';
import 'package:ganadolink_app/dtos/requests/especie.dart';
import 'package:ganadolink_app/dtos/requests/motivo.dart';
import 'package:ganadolink_app/dtos/requests/raza.dart';
import 'package:ganadolink_app/dtos/responses/diet_response.dart';
import 'package:ganadolink_app/dtos/responses/especie_response.dart';
import 'package:ganadolink_app/dtos/responses/motivo_response.dart';
import 'package:ganadolink_app/dtos/responses/raza_response.dart';
import 'package:ganadolink_app/pages/form_page.dart';
import 'package:ganadolink_app/utils/responsive.dart';
import 'package:ganadolink_app/widgets/circular_progress_widget.dart';
import 'package:ganadolink_app/widgets/listview_widget.dart';
import 'package:parallax_cards/parallax_cards.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:ganadolink_app/utils/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final images = [
  {'image': 'assets/images/vaca_1.png'},
  {'image': 'assets/images/vaca_2.png'},
  {'image': 'assets/images/vaca_3.png'},
];

final imagePaths = images.map((imageMap) => imageMap['image']!).toList();

class _HomeScreenState extends State<HomeScreen> {
  ///! Lista de dietas
  List<Diet> diets = [];

  bool isDataLoading = true;
  List<Especie> especies = [];

  List<Raza> razas = [];

  List<Motivo> motivos = [];

  String mostConsumedAlimento = '';
  int count = 0;
  int dietsThisWeek = 0;
  int dietsToday = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initDataLoad(); // Carga inicial de datos
    _loadData();
    _loadDataDate();
  }

  Future<void> _loadData() async {
    try {
      final data = await fetchConsumo();
      setState(() {
        mostConsumedAlimento = data['mostConsumedAlimento'];
        count = data['count'];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Error: $e');
    }
  }

  void initDataLoad() {
    String detectedErrors = '';

    // Llamada para cargar las especies
    fetchEspecies().then((data) {
      setState(() {
        especies = data;
      });
    }).catchError((error) {
      detectedErrors += 'Error al cargar las especies: $error\n';
    });

    fetchDiet().then((data) {
      setState(() {
        diets = data;
      });
    }).catchError((error) {
      detectedErrors += 'Error al cargar las diets: $error\n';
    });

    fetchMotivos().then((data) {
      setState(() {
        motivos = data;
      });
    }).catchError((error) {
      detectedErrors += 'Error al cargar los motivos: $error\n';
    });
    // Llamada para cargar las razas
    fetchRazas().then((data) {
      setState(() {
        razas = data;
      });
    }).catchError((error) {
      detectedErrors += 'Error al cargar las razas: $error\n';
    }).whenComplete(() {
      // Mostrar los errores si existen
      if (detectedErrors.isNotEmpty) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Errores detectados',
          text: detectedErrors.trim(),
        );
      }
    });
  }


  Future<Map<String, dynamic>> fetchConsumo() async {
    final url = Uri.parse('${ws}diets/consumo');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error al obtener datos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al conectar con la API: $e');
    }
  }

  Future<void> _loadDataDate() async {
    try {
      final data = await fetchConsumoDate();
      setState(() {
        dietsThisWeek = data['dietsThisWeek'];
        dietsToday = data['dietsToday'];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Error: $e');
    }
  }

  Future<Map<String, dynamic>> fetchConsumoDate() async {
    final url = Uri.parse('${ws}diets/counts');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error al obtener datos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al conectar con la API: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Responsive resp = Responsive(context);
    // double myWidth = (resp.widthPercent(85));

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: RefreshIndicator(
          onRefresh: () async {
            // Llamada a la función que recarga los datos en el `CustomListview`.
            initDataLoad();
            _loadData();
            _loadDataDate();
          },
          child: Container(
            height: resp.height,
            width: resp.width,
            padding: const EdgeInsets.only(top: 20, right: 0, left: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 26),
                        child: SizedBox(
                          height: 85,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: RichText(
                                  maxLines: 2,
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Gestiona tu ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins'),
                                      ),
                                      TextSpan(
                                        text: 'ganado ',
                                        style: TextStyle(
                                            color: Color(0xffF27D16),
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins'),
                                      ),
                                      TextSpan(
                                        text: 'con un ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins'),
                                      ),
                                      TextSpan(
                                        text: 'toque de innovación',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Otros widgets dentro del ListView principal
                      ParallaxCards(
                        imagesList: imagePaths,
                        scrollDirection: Axis.horizontal,
                        width: 300,
                        height: 180,
                        onTap: (index) {},
                        margin: const EdgeInsets.all(8),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Container(
                            width: 141,
                            height: 42,
                            decoration: BoxDecoration(
                              color: const Color(0xffFDE5D0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FormPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Crear Formulario',
                                style: TextStyle(
                                  color: Color(0xffF27D16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'ESTADÍSTICAS',
                            style: TextStyle(
                                color: Color(0xff434242), fontFamily: 'Poppins', fontSize: 18),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 170,
                            height: 200,
                            decoration: BoxDecoration(
                              color: const Color(0xffDBE4F2),
                              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.2), // Color de la sombra con opacidad
                                  spreadRadius: 0.5, // Propagación de la sombra
                                  blurRadius: 6, // Radio de desenfoque de la sombra
                                  offset: const Offset(2, 4), // Desplazamiento de la sombra (x, y)
                                ),
                              ],
                            ),
                            child: MyCircularProgress(
                              dietsThisWeek: dietsThisWeek,
                              dietsToday: dietsToday,
                            ),
                          ),
                          const SizedBox(width: 16), // Espacio entre los contenedores
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffDBE4F2),
                                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.2), // Color de la sombra con opacidad
                                        spreadRadius: 0.5, // Propagación de la sombra
                                        blurRadius: 6, // Radio de desenfoque de la sombra
                                        offset: const Offset(
                                            2, 4), // Desplazamiento de la sombra (x, y)
                                      ),
                                    ],
                                  ),
                                  width: 152,
                                  height: 90,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                      child: RichText(
                                        maxLines: 2,
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Alimento más consumido: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins'),
                                            ),
                                            TextSpan(
                                              text: '$mostConsumedAlimento ',
                                              style: const TextStyle(
                                                  color: Color(0xff8f939a),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16), // Espacio entre los contenedores
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffDBE4F2),
                                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.2), // Color de la sombra con opacidad
                                        spreadRadius: 0.5, // Propagación de la sombra
                                        blurRadius: 6, // Radio de desenfoque de la sombra
                                        offset: const Offset(
                                            2, 4), // Desplazamiento de la sombra (x, y)
                                      ),
                                    ],
                                  ),
                                  width: 152,
                                  height: 90,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                      child: RichText(
                                        maxLines: 2,
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Total de conteo de alimentos por dieta: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins'),
                                            ),
                                            TextSpan(
                                              text: '$count ',
                                              style: const TextStyle(
                                                  color: Color(0xff8f939a),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 0, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'REGISTROS MÁS RECIENTES',
                              style: TextStyle(
                                  color: Color(0xff434242), fontFamily: 'Poppins', fontSize: 18),
                            ),
                            Text(
                              'Ver más',
                              style: TextStyle(
                                  color: Color(0xff434242), fontFamily: 'Poppins', fontSize: 18),
                            )
                          ],
                        ),
                      ),

                      ///! componente listview
                      CustomListview(
                        key: GlobalKey(),
                        diets: diets,
                        especies: especies,
                        razas: razas,
                        motivos: motivos,
                        fetchData: fetchDiet,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
