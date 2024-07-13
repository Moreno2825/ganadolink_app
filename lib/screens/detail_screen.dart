import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ganadolink_app/components/ButtonIconTransparent.dart';
import 'package:ganadolink_app/components/elevate_button_icon.dart';
import 'package:ganadolink_app/components/square_button.dart';
import 'package:ganadolink_app/utils/constant.dart';
import 'package:ganadolink_app/utils/responsive.dart';
import 'package:ganadolink_app/widgets/listview_horizontal_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Responsive resp = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: Container(
          height: resp.height,
          padding: const EdgeInsets.only(left: 33, right: 33),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevateButtonIcon(
                      height: 45,
                      width: 110,
                      label: 'En camino',
                      labelSize: 15,
                      labelColor: Colors.white,
                      buttonColor: Colors.orange.shade300,
                      onTap: () {
                        null;
                      },
                    ),
                    SquareButton(
                      onTap: () {},
                      iconSize: 24,
                      icon: FontAwesomeIcons.qrcode,
                      iconColor: backgroundColorBlue,
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text("Bovino",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              fontFamily: "Poppins")),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text("—",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                fontFamily: "Poppins")),
                      ),
                      Text("Abasto",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              fontFamily: "Poppins")),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Vendedor",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: "Poppins",
                              color: Colors.grey)),
                      Text("Rodrigo Carabeo Moreno",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: "Poppins")),
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.locationDot,
                              size: 20, color: Colors.grey),
                          Expanded(
                            // Use Expanded here
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "Calle 18 #25 Altabrisam, Mérida, Yucatán",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: "Poppins",
                                    color: Colors.grey),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Comprador",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: "Poppins",
                              color: Colors.grey)),
                      Text("Jesús Trujillo Lizama",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: "Poppins")),
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.locationDot,
                              size: 20, color: Colors.grey),
                          Expanded(
                            // Use Expanded here
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "Calle Carlos Pacheco #215 Centro, Jojutla, Morelos",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: "Poppins",
                                    color: Colors.grey),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Datos del ganado",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: "Poppins",
                              color: Colors.grey)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/moreAnimals');
                        },
                        child: const Text("Ver más",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: "Poppins",
                                color: Colors.grey)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ListViewHorizontal(),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Datos del vehículo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: "Poppins",
                              color: Colors.grey)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Camioneta Marca Chevrolet modelo 1978 con placa FRYHJW23",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: "Poppins")),
                      Text("Remolque color negro con placa SDJEEJ2D",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: "Poppins")),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevateButtonIcon(
                        height: 45,
                        width: 165,
                        icon: FontAwesomeIcons.download,
                        colorIcon: Colors.white,
                        sizeIcon: 20,
                        label: 'Descargar PDF',
                        labelSize: 15,
                        labelColor: Colors.white,
                        buttonColor: kPrimaryColor,
                        onTap: () {
                          null;
                        },
                      ),
                      ButtonIconTransparent(
                          icon: FontAwesomeIcons.solidPenToSquare,
                          iconSize: 22,
                          text: 'Editar',
                          onPressed: () {}),
                      ButtonIconTransparent(
                        icon: FontAwesomeIcons.trash,
                        iconSize: 22,
                        text: 'Eliminar',
                        onPressed: () {},
                        showBorder: false,
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
