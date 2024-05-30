import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ganadolink_app/utils/constant.dart';
import 'package:ganadolink_app/utils/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

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
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                child: Column(
                  children: [
                    RichText(
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
                        ],
                      ),
                    ),
                    const Text(
                      'Con un toque de innovación',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    
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
