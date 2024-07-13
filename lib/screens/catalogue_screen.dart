import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ganadolink_app/components/elevate_button_icon.dart';
import 'package:ganadolink_app/components/search_bar.dart';
import 'package:ganadolink_app/components/square_button.dart';
import 'package:ganadolink_app/utils/constant.dart';
import 'package:ganadolink_app/utils/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ganadolink_app/widgets/listview_widget.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  @override
  Widget build(BuildContext context) {
    Responsive resp = Responsive(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Catalogue",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: IconButton(
              icon: const Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          centerTitle: true,
        ),
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
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: resp.height,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(26),
                            child: Row(
                              children: [
                                // ignore: deprecated_member_use
                                MySearchBar(
                                    backgroundColor: Colors.grey.shade200,
                                    // ignore: deprecated_member_use
                                    icon: FontAwesomeIcons.search,
                                    iconSize: 15,
                                    iconColor: Colors.grey,
                                    textFieldColor: Colors.grey,
                                    hintText: 'Buscar...',
                                    hintTextColor: Colors.grey),
                                const SizedBox(width: 10),
                                SquareButton(
                                    onTap: () {},
                                    iconSize: 24,
                                    icon: FontAwesomeIcons.qrcode,
                                    iconColor: backgroundColorBlue,
                                    backgroundColor: Colors.grey.shade200),
                                const SizedBox(width: 10),
                                SquareButton(
                                    onTap: () {},
                                    iconSize: 24,
                                    icon: FontAwesomeIcons.download,
                                    iconColor: backgroundColorBlue,
                                    backgroundColor: Colors.grey.shade200),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: CustomListview(
                              height: 550,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 46,
                        right: 18,
                        child: SizedBox(
                            height: 58,
                            width: 115,
                            child: ElevateButtonIcon(
                              label: 'Nuevo',
                              icon: FontAwesomeIcons.plus,
                              sizeIcon: 25,
                              colorIcon: kPrimaryColor,
                              labelColor: kPrimaryColor,
                              buttonColor: backGroundColor,
                              onTap: () {},
                            )),
                      )
                    ],
                  ),
                ))));
  }
}
