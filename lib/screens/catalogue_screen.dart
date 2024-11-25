import 'package:flutter/material.dart';
import 'package:ganadolink_app/dtos/requests/diet.dart';
import 'package:ganadolink_app/dtos/requests/especie.dart';
import 'package:ganadolink_app/dtos/requests/motivo.dart';
import 'package:ganadolink_app/dtos/requests/raza.dart';
import 'package:ganadolink_app/dtos/responses/diet_response.dart';
import 'package:ganadolink_app/dtos/responses/especie_response.dart';
import 'package:ganadolink_app/dtos/responses/motivo_response.dart';
import 'package:ganadolink_app/dtos/responses/raza_response.dart';
import 'package:ganadolink_app/utils/responsive.dart';
import 'package:ganadolink_app/widgets/listview_search_widget.dart';
import 'package:ganadolink_app/widgets/listview_widget.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  List<Diet> diets = [];

  List<Especie> especies = [];

  List<Raza> razas = [];

  List<Motivo> motivos = [];

  @override
  void initState() {
    super.initState();
    initDataLoad(); // Carga inicial de datos
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

  @override
  Widget build(BuildContext context) {
    Responsive resp = Responsive(context);
    // double myWidth = (resp.widthPercent(85));
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          // Llamada a la función que recarga los datos en el `CustomListview`.
          initDataLoad();
        },
        child: Container(
          height: resp.height,
          width: resp.width,
          padding: const EdgeInsets.only(top: 20, right: 0, left: 10),
          child: CustomListviewSearch(
            key: GlobalKey(),
            diets: diets,
            especies: especies,
            razas: razas,
            motivos: motivos,
            fetchData: fetchDiet,
          ),
        ),
      ),
    );
  }
}
