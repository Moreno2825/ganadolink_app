// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ganadolink_app/components/screens/catalogue_screen.dart';
import 'package:ganadolink_app/components/screens/home_screen.dart';
import 'package:ganadolink_app/components/screens/user_screen.dart';

class NavbarWidget extends StatefulWidget {
  final List<String> routes;
  final List<IconData> icons;

  const NavbarWidget({
    super.key,
    required this.routes,
    required this.icons,
  });

  @override
  _NavbarWidgetState createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  int _currentIndex = 0;

  void _onPopInvoked(bool didPop) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content: const Text('¿Desea salir de la aplicación?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
            TextButton(
              child: const Text('Salir'),
              onPressed: () {
                SystemNavigator.pop(); // Cierra la aplicación
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        _onPopInvoked(didPop);
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            HomeScreen(),
            CatalogueScreen(),
            UserScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          currentIndex: _currentIndex,
          items: List.generate(
            widget.routes.length,
            (index) => BottomNavigationBarItem(
              label: widget.routes[index].substring(1),
              icon: Icon(widget.icons[index]),
            ),
          ),
        ),
      ),
    );
  }
}
