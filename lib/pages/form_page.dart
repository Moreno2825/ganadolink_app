import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ganadolink_app/components/custom_progress_form.dart';
import 'package:ganadolink_app/components/custom_text_field.dart';
import 'package:ganadolink_app/extensions/space_exs.dart';
import 'package:ganadolink_app/utils/form_validate_functions.dart';
import 'package:ganadolink_app/utils/responsive.dart';
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

  ///! ---------------------------------------------------------------------------------------------
  ///! FOCUS NODE
  ///! ---------------------------------------------------------------------------------------------
  FocusNode nameFocusNode = FocusNode();
  FocusNode domicilioFocusNode = FocusNode();
  FocusNode municipioFocusNode = FocusNode();

  ///! ---------------------------------------------------------------------------------------------
  ///! FOCUS NODE
  ///! ---------------------------------------------------------------------------------------------
  GlobalKey<FormState> formKeyA = GlobalKey();
  GlobalKey nameKey = GlobalKey();
  GlobalKey domicilioKey = GlobalKey();
  GlobalKey municipioKey = GlobalKey();

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ProgressForm(
                        text: 'Generales',
                        icon: FontAwesomeIcons.one,
                        color: Color(0xff00B200),
                      ),
                      12.w,
                      const ProgressForm(
                        text: 'Ganado',
                        icon: FontAwesomeIcons.two,
                      ),
                      12.w,
                      const ProgressForm(
                        text: 'Vehículo',
                        icon: FontAwesomeIcons.three,
                        color: Color(0xffacacac),
                      ),
                      12.w,
                    ],
                  ),
                  15.h,
                  SizedBox(
                    width: myWidth,
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'DATOS GENERALES',
                            style: TextStyle(
                                fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          12.h,
                          const Text(
                            'Especie a movilizar',
                            style: TextStyle(
                                fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          12.h,
                          ResponsiveGridRow(
                            children: [
                              ResponsiveGridCol(
                                lg: 6,
                                child: SizedBox(
                                  height: 20,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        value: selected,
                                        activeColor: Colors.blue,
                                        onChanged: (value) {
                                          setState(() {
                                            selected = value!;
                                          });
                                        },
                                      ),
                                      const Text('Bovino'),
                                    ],
                                  ),
                                ),
                              ),
                              ResponsiveGridCol(
                                lg: 6,
                                child: SizedBox(
                                  height: 20,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        value: selected,
                                        activeColor: Colors.blue,
                                        onChanged: (value) {
                                          setState(() {
                                            selected = value!;
                                          });
                                        },
                                      ),
                                      const Text('Porcino'),
                                    ],
                                  ),
                                ),
                              ),
                              ResponsiveGridCol(
                                lg: 6,
                                child: SizedBox(
                                  height: 20,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        value: selected,
                                        activeColor: Colors.blue,
                                        onChanged: (value) {
                                          setState(() {
                                            selected = value!;
                                          });
                                        },
                                      ),
                                      const Text('Aviar'),
                                    ],
                                  ),
                                ),
                              ),
                              ResponsiveGridCol(
                                lg: 6,
                                child: SizedBox(
                                  height: 20,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        value: selected,
                                        activeColor: Colors.blue,
                                        onChanged: (value) {
                                          setState(() {
                                            selected = value!;
                                          });
                                        },
                                      ),
                                      const Text('Otro'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          12.h,
                          const Text(
                            'Datos del remitente',
                            style: TextStyle(
                                fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          ResponsiveGridRow(
                            children: [
                              ResponsiveGridCol(
                                lg: 6,
                                child: CustomTextField(
                                  label: 'Nombre',
                                  isEnable: false,
                                  floatingLabel: false,
                                  maxLength: 40,
                                  focusNode: nameFocusNode,
                                  textEditingController: nameController,
                                  validator: (text) {
                                    return FormsValidate.inputString(text, 'Especificar Nombre');
                                  },
                                  onChanged: (text) {},
                                ),
                              ),
                              ResponsiveGridCol(
                                lg: 6,
                                child: CustomTextField(
                                  label: 'Domicilio',
                                  isEnable: false,
                                  floatingLabel: false,
                                  maxLength: 40,
                                  focusNode: domicilioFocusNode,
                                  textEditingController: domicilioController,
                                  validator: (text) {
                                    return FormsValidate.inputString(text, 'Especificar Dirección');
                                  },
                                  onChanged: (text) {},
                                ),
                              ),
                              ResponsiveGridCol(
                                lg: 6,
                                child: CustomTextField(
                                  label: 'Municipio',
                                  isEnable: false,
                                  floatingLabel: false,
                                  maxLength: 40,
                                  focusNode: municipioFocusNode,
                                  textEditingController: municipioController,
                                  validator: (text) {
                                    return FormsValidate.inputString(text, 'Especificar Municipio');
                                  },
                                  onChanged: (text) {},
                                ),
                              ),
                            ],
                          ),
                          12.h,
                          const Text(
                            'Datos del destinatario',
                            style: TextStyle(
                                fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          ResponsiveGridRow(
                            children: [
                              ResponsiveGridCol(
                                lg: 6,
                                child: CustomTextField(
                                  label: 'Nombre',
                                  isEnable: false,
                                  floatingLabel: false,
                                  maxLength: 40,
                                  focusNode: nameFocusNode,
                                  textEditingController: nameController,
                                  validator: (text) {
                                    return FormsValidate.inputString(text, 'Especificar Nombre');
                                  },
                                  onChanged: (text) {},
                                ),
                              ),
                              ResponsiveGridCol(
                                lg: 6,
                                child: CustomTextField(
                                  label: 'Domicilio',
                                  isEnable: false,
                                  floatingLabel: false,
                                  maxLength: 40,
                                  focusNode: domicilioFocusNode,
                                  textEditingController: domicilioController,
                                  validator: (text) {
                                    return FormsValidate.inputString(text, 'Especificar Dirección');
                                  },
                                  onChanged: (text) {},
                                ),
                              ),
                              ResponsiveGridCol(
                                lg: 6,
                                child: CustomTextField(
                                  label: 'Municipio',
                                  isEnable: false,
                                  floatingLabel: false,
                                  maxLength: 40,
                                  focusNode: municipioFocusNode,
                                  textEditingController: municipioController,
                                  validator: (text) {
                                    return FormsValidate.inputString(text, 'Especificar Municipio');
                                  },
                                  onChanged: (text) {},
                                ),
                              ),
                            ],
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
}
