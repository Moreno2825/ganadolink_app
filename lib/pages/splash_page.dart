import 'package:flutter/material.dart';
import 'package:ganadolink_app/components/custom_button.dart';
import 'package:ganadolink_app/pages/login_page.dart';
import 'package:ganadolink_app/utils/responsive.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
    );
  }
}
