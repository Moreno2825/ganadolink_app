import 'package:flutter/material.dart';
import 'package:ganadolink_app/components/custom_button.dart';
import 'package:ganadolink_app/pages/login_page.dart';
import 'package:ganadolink_app/utils/responsive.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    // Retrasar 2 segundos antes de navegar a la página de inicio de sesión
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    Responsive resp = Responsive(context);
    //
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.scaleDown,
            height: resp.height * 0.86,
          ),
        ],
      ),
    );
  }
}
