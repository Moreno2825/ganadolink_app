import 'package:flutter/material.dart';
import 'package:ganadolink_app/pages/login_page.dart';
import 'package:ganadolink_app/pages/splash_page.dart';
import 'package:ganadolink_app/components/screens/catalogue_screen.dart';
import 'package:ganadolink_app/components/screens/home_screen.dart';
import 'package:ganadolink_app/components/screens/user_screen.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/home_screen': (context) => const HomeScreen(),
      '/catalogue_screen': (context) => const CatalogueScreen(),
      '/users_screen': (context) => const UserScreen(),
      '/Login': (context) => const LoginPage(),
    },
    debugShowCheckedModeBanner: false,
    home: const SplashPage(),
  ));
}
