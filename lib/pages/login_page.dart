import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ganadolink_app/components/custom_button.dart';
import 'package:ganadolink_app/components/custom_text_field.dart';
import 'package:ganadolink_app/utils/constant.dart';
import 'package:ganadolink_app/utils/form_validate_functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  GlobalKey<FormState> formKeyA = GlobalKey();

  GlobalKey nameKey = GlobalKey();
  GlobalKey passwordKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: 200,
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '¡Qué bueno tenerte de',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                            TextSpan(
                              text: ' Regreso!',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Para mantener nuestra operación sin interrupciones, necesitaríamos que completes los datos necesarios.',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Color(0xff5A5A5A),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 500,
                            child: Form(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 345,
                                    child: CustomTextField(
                                      label: 'Correo',
                                      isEnable: false,
                                      focusNode: nameFocusNode,
                                      textEditingController: nameController,
                                      validator: (text) {
                                        return FormsValidate.inputString(
                                            text, 'Especificar Correo');
                                      },
                                      onChanged: (text) {},
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 340,
                                    child: CustomTextField(
                                      label: 'Contraseña',
                                      isEnable: false,
                                      focusNode: passwordFocusNode,
                                      textEditingController: passwordController,
                                      validator: (text) {
                                        return FormsValidate.inputString(
                                            text, 'Especificar Contraseña');
                                      },
                                      onChanged: (text) {},
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomButton(
                                    label: 'Entrar',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const LoginPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
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
