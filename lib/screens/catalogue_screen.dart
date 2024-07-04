import 'dart:ui';

import 'package:flutter/material.dart';
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
    double myWidth = (resp.widthPercent(85));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalogue",
          style: TextStyle(
            fontWeight: FontWeight.bold,
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
            height: resp.height,
            width: resp.width,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4, // Ocupa 2/5 del espacio disponible en el Row
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              const Icon(
                                  size: 15,
                                  FontAwesomeIcons.search,
                                  color: Colors.grey),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  style: const TextStyle(color: Colors.grey),
                                  decoration: InputDecoration(
                                    hintText: 'Buscar...',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.7)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Contenedor 2
                    Expanded(
                      flex: 1, // Ocupa 1/5 del espacio disponible en el Row
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        child: const Center(
                          child: Icon(
                              size: 25,
                              FontAwesomeIcons.qrcode,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1, // Ocupa 1/5 del espacio disponible en el Row
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        child: const Center(
                          child: Icon(
                              size: 25,
                              FontAwesomeIcons.download,
                              color: Colors.blue),
                        ),
                      ),
                    ),

                   
                  ],
                ),
                 const CustomListview()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
