import 'package:flutter/material.dart';
import 'package:ganadolink_app/components/custom_button.dart';
import 'package:ganadolink_app/components/custom_progress_form.dart';
import 'package:ganadolink_app/components/custom_select.dart';
import 'package:ganadolink_app/components/custom_text_field.dart';
import 'package:ganadolink_app/dtos/requests/diet.dart';
import 'package:ganadolink_app/dtos/requests/especie.dart';
import 'package:ganadolink_app/dtos/requests/motivo.dart';
import 'package:ganadolink_app/dtos/requests/raza.dart';
import 'package:ganadolink_app/dtos/responses/diet_response.dart';
import 'package:ganadolink_app/dtos/responses/especie_response.dart';
import 'package:ganadolink_app/dtos/responses/motivo_response.dart';
import 'package:ganadolink_app/dtos/responses/raza_response.dart';
import 'package:ganadolink_app/extensions/space_exs.dart';
import 'package:ganadolink_app/utils/form_validate_functions.dart';
import 'package:ganadolink_app/utils/responsive.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  ///! ---------------------------------------------------------------------------------------------
  ///! VARIABLES
  ///! ---------------------------------------------------------------------------------------------
  bool selected = false;

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
  List<Especie> especies = [];

  Raza? selectedRaza;
  List<Raza> razas = [];

  Motivo? selectedMotivo;
  List<Motivo> motivos = [];

  @override
  void initState() {
    super.initState();
    initDataLoad();
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
    double myWidth = (resp.widthPercent(75));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulario',
          style: TextStyle(fontSize: 22, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: resp.height,
        width: resp.width,
        color: Colors.white,
        padding: const EdgeInsets.all(24),
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
                                fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          12.h,
                          ResponsiveGridRow(
                            children: [
                              ResponsiveGridCol(
                                lg: 6,
                                child: MyComboBoxFilterV3(
                                  listOptions: motivos,
                                  selectedItem: selectedMotivo,
                                  labelText: 'Motivo *',
                                  fontSize: 13,
                                  fontSizeLabel: 13,
                                  validator: (value) {
                                    return FormsValidate.select(value, 'Seleccionar especie');
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
                                  listOptions: especies,
                                  selectedItem: selectedEspecie,
                                  labelText: 'Especie *',
                                  fontSize: 13,
                                  fontSizeLabel: 13,
                                  validator: (value) {
                                    return FormsValidate.select(value, 'Seleccionar especie');
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
                                  listOptions: razas,
                                  selectedItem: selectedRaza,
                                  labelText: 'Raza *',
                                  fontSize: 13,
                                  fontSizeLabel: 13,
                                  validator: (value) {
                                    return FormsValidate.select(value, 'Seleccionar especie');
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
                                fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.bold),
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
                                    return FormsValidate.inputString(text, 'Especificar Peso');
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
                                    return FormsValidate.inputString(text, 'Especificar Sexo');
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
                                    return FormsValidate.inputString(text, 'Especificar Color');
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
                          20.h,
                          CustomButton(
                            label: 'Guardar',
                            size: 345,
                            onPressed: () {
                              saveOnPress();
                            },
                          ),
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
    );
  }

  void initFields() {
    selectedMotivo = null;
    selectedEspecie = null;
    selectedRaza = null;
    nameController.clear();
    domicilioController.clear();
    municipioController.clear();
    colorController.clear();
    sexoController.clear();
    areteController.clear();
    pesoController.clear();
  }

  void saveOnPress() async {
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
        await createDiet(dietData);

        // Mostrar notificación de éxito
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Dieta creada exitosamente',
        );
        initFields();
      } catch (error) {
        // Mostrar notificación de error
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'Error al crear la dieta: $error',
        );
      }
    }
  }
}
