import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ganadolink_app/screens/catalogue_screen.dart';
import 'package:ganadolink_app/screens/home_screen.dart';
import 'package:ganadolink_app/screens/user_screen.dart';

import 'package:ganadolink_app/utils/constant.dart';

class NavbarWidget extends StatefulWidget {
  final List<String> routes;
  final List<IconData> icons;

  const NavbarWidget({
    super.key,
    required this.routes,
    required this.icons,
  });

  @override
  // ignore: library_private_types_in_public_api
  _NavbarWidgetState createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onPopInvoked(true);
        return false;
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
        bottomNavigationBar: BottomAppBar(
          color: backGroundColor,
          child: Row(
            children: List.generate(
              widget.routes.length,
              (index) => Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: _currentIndex == index
                            ? const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffFBD8BA),
                                  ),
                                ],
                              )
                            : null,
                        width: 66,
                        height: 32,
                        child: Icon(
                          size: 20,
                          widget.icons[index],
                          color: _currentIndex == index ? const Color(0xffF59847) : kIconColor,
                        ),
                      ),
                      Text(
                        widget.routes[index],
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: kIconColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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
}
