import 'package:flutter/material.dart';
import 'package:ganadolink_app/utils/responsive.dart';
import 'package:ganadolink_app/widgets/listview_widget.dart';
import 'package:parallax_cards/parallax_cards.dart';
// import 'package:parallax_cards/parallax_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final images = [
  {'image': 'assets/images/vaca_1.png'},
  {'image': 'assets/images/vaca_2.png'},
  {'image': 'assets/images/vaca_3.png'},
  {'image': 'assets/images/vaca_3.png'},
  {'image': 'assets/images/vaca_3.png'},
];

final imagePaths = images.map((imageMap) => imageMap['image']!).toList();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Responsive resp = Responsive(context);
    // double myWidth = (resp.widthPercent(85));

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: resp.height,
          width: resp.width,
          padding: const EdgeInsets.only(top: 20, right: 0, left: 20),
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
                              padding: const EdgeInsets.all(8.0),
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
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: 141,
                          height: 42,
                          decoration: BoxDecoration(
                            color: const Color(0xffFDE5D0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                            onPressed: () {},
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
                      padding: EdgeInsets.only(left: 10),
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
                        ),
                        const SizedBox(width: 16), // Espacio entre los contenedores
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
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
                                      offset:
                                          const Offset(2, 4), // Desplazamiento de la sombra (x, y)
                                    ),
                                  ],
                                ),
                                width: 152,
                                height: 90,
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
                                      offset:
                                          const Offset(2, 4), // Desplazamiento de la sombra (x, y)
                                    ),
                                  ],
                                ),
                                width: 152,
                                height: 90,
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
                    const CustomListview(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


