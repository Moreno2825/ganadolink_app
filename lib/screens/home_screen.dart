import 'package:flutter/material.dart';
import 'package:ganadolink_app/utils/constant.dart';
import 'package:ganadolink_app/utils/responsive.dart';
import 'package:parallax_cards/parallax_cards.dart';

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
    double myWidth = (resp.widthPercent(85));

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: resp.height,
          width: resp.width,
          padding: const EdgeInsets.only(top: 20, right: 8, left: 8),
          child: Column(
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
                                    color: kPrimaryColor,
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
              ParallaxCards(
                imagesList: imagePaths,
                scrollDirection: Axis.horizontal,
                width: 300,
                height: 180,
                onTap: (index) {},
                margin: const EdgeInsets.all(8),
              )
            ],
          ),
        ),
      ),
    );
  }
}
