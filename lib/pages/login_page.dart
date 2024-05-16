import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ganadolink_app/components/custom_button.dart';
import 'package:ganadolink_app/components/custom_text_field.dart';
import 'package:ganadolink_app/components/text_field_password.dart';
import 'package:ganadolink_app/utils/constant.dart';
import 'package:ganadolink_app/utils/form_validate_functions.dart';
import 'package:ganadolink_app/utils/responsive.dart';
import 'package:ganadolink_app/widgets/navbar_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///!
  bool obscureTextPassword = true;

  ///! TextEditing
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ///! FocusNode
  FocusNode nameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  GlobalKey<FormState> formKeyA = GlobalKey();

  GlobalKey nameKey = GlobalKey();
  GlobalKey passwordKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Responsive resp = Responsive(context);
    double myWidth = (resp.widthPercent(85));

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
            height: resp.height,
            width: resp.width,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: 150,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '¡Qué bueno tenerte   ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              ),
                              TextSpan(
                                text: 'de',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              ),
                              TextSpan(
                                text: ' regreso!',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 14, right: 10),
                        child: Text(
                          'Para mantener nuestra operación sin interrupciones, necesitaríamos que completes los datos necesarios.',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Color(0xff5A5A5A),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: myWidth,
                            child: Form(
                              key: formKeyA,
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: CustomTextField(
                                      label: 'Correo',
                                      isEnable: false,
                                      floatingLabel: false,
                                      maxLength: 40,
                                      focusNode: nameFocusNode,
                                      textEditingController: nameController,
                                      icon: FontAwesomeIcons.envelope,
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
                                    child: TextFieldPassword(
                                      label: 'Contraseña',
                                      isEnable: false,
                                      floatingLabel: false,
                                      icon: FontAwesomeIcons.lock,
                                      isViewPassword: true,
                                      obscureText: obscureTextPassword,
                                      focusNode: passwordFocusNode,
                                      onClickEye: (value){
                                        setState(() {
                                          obscureTextPassword = !obscureTextPassword;
                                        });
                                      },
                                      textEditingController: passwordController,
                                      validator: (text) {
                                        return FormsValidate.password(text);
                                      },
                                      onChanged: (text) {},
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 37,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CustomButton(
                                      label: 'Entrar',
                                      size: myWidth,
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const NavbarWidget(
                                              routes: ['/Home', '/Catalogue', '/Users'],
                                              icons: [Icons.home, Icons.folder, Icons.person],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
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
