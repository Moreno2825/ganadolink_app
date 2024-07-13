import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ganadolink_app/utils/responsive.dart';
import 'package:ganadolink_app/widgets/grid_widget.dart';

class MoreAnimals extends StatefulWidget {
  const MoreAnimals({super.key});

  @override
  State<MoreAnimals> createState() => _MoreAnimalsState();
}

class _MoreAnimalsState extends State<MoreAnimals> {
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
      body: Container(
        padding: const EdgeInsets.all(30),
        height: resp.height,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Todos los animales",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: "Poppins",
                      )),
                   Text("20 animales",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: "Poppins",
                          color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(child: MyGrid()),
          ],
        ),
      ),
    );
  }
}
