import 'package:flutter/material.dart';
import 'package:ganadolink_app/components/screens/Catalogue.dart';
import 'package:ganadolink_app/components/screens/Home.dart';
import 'package:ganadolink_app/components/screens/Users.dart';
import 'package:ganadolink_app/widgets/NavBar.dart';


void main() {
  runApp(  MaterialApp(
    routes: {

      '/Home': (context) => const HomeScreen(),
      '/Catalogue': (context) => const CatalogueScreen(),
      '/Users': (context) => const UserScreen(),
    }, 
  debugShowCheckedModeBanner: false,
  home: NavbarWidget(
  routes: ['/Home', '/Catalogue', '/Users'],
  icons: [Icons.home, Icons.folder, Icons.person],
),
  ));
}