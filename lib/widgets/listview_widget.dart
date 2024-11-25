// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ganadolink_app/components/custom_select.dart';
import 'package:ganadolink_app/components/custom_text_field.dart';
import 'package:ganadolink_app/dtos/requests/diet.dart';
import 'package:ganadolink_app/dtos/requests/especie.dart';
import 'package:ganadolink_app/dtos/requests/motivo.dart';
import 'package:ganadolink_app/dtos/requests/raza.dart';
import 'package:ganadolink_app/dtos/responses/diet_response.dart';
import 'package:ganadolink_app/extensions/space_exs.dart';
import 'package:ganadolink_app/utils/form_validate_functions.dart';
import 'package:ganadolink_app/utils/responsive.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:responsive_grid/responsive_grid.dart';

class CustomListview extends StatefulWidget {
  final double height;
  final List<Diet> diets;
  final List<Especie> especies;
  final List<Raza> razas;
  final List<Motivo> motivos;
  final Future<void> Function() fetchData;
  const CustomListview({
    super.key,
    this.height = 450,
    required this.diets,
    required this.fetchData,
    required this.especies,
    required this.razas,
    required this.motivos,
  });

  @override
  State<CustomListview> createState() => _CustomListviewState();
}

class _CustomListviewState extends State<CustomListview> {
  ///! ---------------------------------------------------------------------------------------------
  ///! EDITING CONTROLLER
  ///! ---------------------------------------------------------------------------------------------
  TextEditingController nameController = TextEditingController();
  TextEditingController domicilioController = TextEditingController();
  TextEditingController municipioController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController sexoController = TextEditingController();
  TextEditingController areteController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  ///! ---------------------------------------------------------------------------------------------
  ///! FOCUS NODE
  ///! ---------------------------------------------------------------------------------------------
  FocusNode nameFocusNode = FocusNode();
  FocusNode domicilioFocusNode = FocusNode();
  FocusNode municipioFocusNode = FocusNode();
  FocusNode especieFocusNode = FocusNode();
  FocusNode motivosFocusNode = FocusNode();
  FocusNode sexoFocusNode = FocusNode();
  FocusNode colorFocusNode = FocusNode();
  FocusNode areteFocusNode = FocusNode();
  FocusNode pesoFocusNode = FocusNode();

  ///! ---------------------------------------------------------------------------------------------
  ///! FOCUS NODE
  ///! ---------------------------------------------------------------------------------------------
  GlobalKey<FormState> formKeyA = GlobalKey();
  GlobalKey nameKey = GlobalKey();
  GlobalKey domicilioKey = GlobalKey();
  GlobalKey municipioKey = GlobalKey();
  GlobalKey colorKey = GlobalKey();
  GlobalKey sexoKey = GlobalKey();
  GlobalKey areteKey = GlobalKey();
  GlobalKey pesoKey = GlobalKey();

  Especie? selectedEspecie;
  List<Especie> especiesList = [];

  Raza? selectedRaza;
  List<Raza> razasList = [];

  Motivo? selectedMotivo;
  List<Motivo> motivosList = [];

  @override
  void initState() {
    super.initState();
    initDataLoad(); // Carga inicial de datos
  }

  void initDataLoad() {
    motivosList = widget.motivos;
    especiesList = widget.especies;
    razasList = widget.razas;
  }

  @override
  Widget build(BuildContext context) {
    Responsive resp = Responsive(context);
    double myWidth = (resp.widthPercent(80));

    return Container(
      height: widget.diets.length <= 1 ? 145 : (200 + (widget.diets.length * 38.0)),
      padding: const EdgeInsets.only(right: 20),
      child: ListView.builder(
        itemCount: widget.diets.length,
        itemBuilder: (context, i) {
          final diet = widget.diets[i];
          return Dismissible(
            key: ValueKey(diet.id),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) async {
              try {
                await deleteDiet(diet.id);
                setState(() {
                  widget.diets.removeAt(i);
                });
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: 'Dieta eliminada exitosamente',
                );
              } catch (e) {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  text: 'Error al eliminar la dieta: $e',
                );
              }
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: GestureDetector(
              onTap: () {
                // Obtener los datos del ítem seleccionado
                final diet = widget.diets[i];

                // Actualizar los controladores de texto y los selects
                setState(() {
                  colorController.text = diet.ganado?.color ?? '';
                  sexoController.text = diet.ganado?.sexo ?? '';
                  areteController.text = diet.ganado?.siniiga ?? '';
                  pesoController.text = diet.ganado?.peso.toString() ?? '';

                  // Actualizar los selects
                  selectedEspecie = especiesList.cast<Especie?>().firstWhere(
                        (especie) => especie?.id == diet.especie?.id,
                        orElse: () => null,
                      );
                  selectedMotivo = motivosList.cast<Motivo?>().firstWhere(
                        (motivo) => motivo?.id == diet.motivo?.id,
                        orElse: () => null,
                      );
                });
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      title: const Text('Detalles de la Dieta'),
                      content: Container(
                        height: 900,
                        width: myWidth,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView(
                                children: [
                                  15.h,
                                  SizedBox(
                                    width: myWidth,
                                    child: Form(
                                      key: formKeyA,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'DATOS GENERALES',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          12.h,
                                          ResponsiveGridRow(
                                            children: [
                                              ResponsiveGridCol(
                                                lg: 6,
                                                child: MyComboBoxFilterV3(
                                                  listOptions: motivosList,
                                                  selectedItem: selectedMotivo,
                                                  labelText: 'Motivo *',
                                                  fontSize: 13,
                                                  fontSizeLabel: 13,
                                                  validator: (value) {
                                                    return FormsValidate.select(
                                                        value, 'Seleccionar especie');
                                                  },
                                                  focusNode: motivosFocusNode,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedMotivo = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              ResponsiveGridCol(
                                                lg: 6,
                                                child: MyComboBoxFilterV3(
                                                  listOptions: especiesList,
                                                  selectedItem: selectedEspecie,
                                                  labelText: 'Especie *',
                                                  fontSize: 13,
                                                  fontSizeLabel: 13,
                                                  validator: (value) {
                                                    return FormsValidate.select(
                                                        value, 'Seleccionar especie');
                                                  },
                                                  focusNode: especieFocusNode,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedEspecie = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              ResponsiveGridCol(
                                                lg: 6,
                                                child: MyComboBoxFilterV3(
                                                  listOptions: razasList,
                                                  selectedItem: selectedRaza,
                                                  labelText: 'Raza *',
                                                  fontSize: 13,
                                                  fontSizeLabel: 13,
                                                  validator: (value) {
                                                    return FormsValidate.select(
                                                        value, 'Seleccionar especie');
                                                  },
                                                  focusNode: especieFocusNode,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedRaza = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          12.h,
                                          const Text(
                                            'DATOS GENERALES',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          12.h,
                                          ResponsiveGridRow(
                                            children: [
                                              ResponsiveGridCol(
                                                lg: 6,
                                                child: CustomTextField(
                                                  label: 'Peso a KG',
                                                  isEnable: false,
                                                  floatingLabel: false,
                                                  maxLength: 40,
                                                  focusNode: pesoFocusNode,
                                                  textEditingController: pesoController,
                                                  validator: (text) {
                                                    return FormsValidate.inputString(
                                                        text, 'Especificar Peso');
                                                  },
                                                  onChanged: (text) {},
                                                ),
                                              ),
                                              ResponsiveGridCol(
                                                lg: 6,
                                                child: CustomTextField(
                                                  label: 'Sexo',
                                                  isEnable: false,
                                                  floatingLabel: false,
                                                  maxLength: 40,
                                                  focusNode: sexoFocusNode,
                                                  textEditingController: sexoController,
                                                  validator: (text) {
                                                    return FormsValidate.inputString(
                                                        text, 'Especificar Sexo');
                                                  },
                                                  onChanged: (text) {},
                                                ),
                                              ),
                                              ResponsiveGridCol(
                                                lg: 6,
                                                child: CustomTextField(
                                                  label: 'Color',
                                                  isEnable: false,
                                                  floatingLabel: false,
                                                  maxLength: 40,
                                                  focusNode: colorFocusNode,
                                                  textEditingController: colorController,
                                                  validator: (text) {
                                                    return FormsValidate.inputString(
                                                        text, 'Especificar Color');
                                                  },
                                                  onChanged: (text) {},
                                                ),
                                              ),
                                              ResponsiveGridCol(
                                                lg: 6,
                                                child: CustomTextField(
                                                  label: 'Arete Siniiga',
                                                  isEnable: false,
                                                  floatingLabel: false,
                                                  maxLength: 40,
                                                  focusNode: areteFocusNode,
                                                  textEditingController: areteController,
                                                  validator: (text) {
                                                    return FormsValidate.inputString(
                                                        text, 'Especificar Arete Siniiga');
                                                  },
                                                  onChanged: (text) {},
                                                ),
                                              ),
                                            ],
                                          ),
                                          10.h,
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cerrar'),
                        ),
                        TextButton(
                          onPressed: () {
                            saveOnPress(diet.id);
                          },
                          child: const Text('Actualizar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                height: 120,
                padding: const EdgeInsets.only(left: 20),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  color: const Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          diet.id,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 66,
                            height: 23,
                            decoration: const BoxDecoration(
                              color: Color(0xff00B200),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                diet.ganado!.raza,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Alimento: ${diet.dieta!.alimento}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: Color(0xff666565),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.pets,
                          color: Color(0xff9a9a9a),
                        ),
                        Text(
                          diet.ganado!.siniiga,
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff9a9a9a),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Peso: ${diet.ganado!.peso}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: Color(0xff9a9a9a),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void saveOnPress(String dietId) async {
    final isOk = formKeyA.currentState!.validate();

    if (isOk) {
      // Construir los datos de la dieta
      final dietData = {
        "id_user": "673ec44f803f14389770648c",
        "id_especie": selectedEspecie?.id ?? '',
        "id_motivo": selectedMotivo?.id ?? '',
        "ganado": {
          "sexo": sexoController.text,
          "id_raza": selectedRaza?.id ?? '',
          "color": colorController.text,
          "peso": pesoController.text,
          "siniiga": areteController.text,
        }
      };

      try {
        await updateDiet(dietId,dietData);

        // Mostrar notificación de éxito
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Dieta actualizada exitosamente',
        );
      } catch (error) {
        // Mostrar notificación de error
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Error al actualizar la dieta: $error',
        );
      }
    }
  }
}
