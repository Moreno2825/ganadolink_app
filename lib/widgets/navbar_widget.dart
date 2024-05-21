import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ganadolink_app/components/screens/catalogue_screen.dart';
import 'package:ganadolink_app/components/screens/home_screen.dart';
import 'package:ganadolink_app/components/screens/user_screen.dart';

import 'package:ganadolink_app/utils/constant.dart';

class NavbarWidget extends StatefulWidget {
  final List<String> routes;
  final List<IconData> icons;

  const NavbarWidget({
    Key? key,
    required this.routes,
    required this.icons,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavbarWidgetState createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  int _currentIndex = 0;
  Color _shadowColor = kPrimaryColor.withOpacity(0.1);

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
          color: backgroundPale,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              widget.routes.length,
              (index) => Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                        // Cambia el color de la sombra al tocar el ícono
                        _shadowColor = kPrimaryColor.withOpacity(
                            0.1); // Modificado el valor de opacidad
                      });
                    },
                    onTapCancel: () {
                      // Restaura el color de la sombra al cancelar la pulsación
                      setState(() {
                        _shadowColor = Colors.transparent;
                      });
                    },
                    // ignore: sort_child_properties_last
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          widget.icons[index],
                          color: _currentIndex == index
                              ? kPrimaryColor
                              : kIconColor,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.routes[index],
                          style: TextStyle(
                            color: _currentIndex == index
                                ? kPrimaryColor
                                : kIconColor,
                          ),
                        ),
                      ],
                    ),

                    splashColor: _shadowColor,
                    highlightColor: _shadowColor,
                    borderRadius: BorderRadius.circular(20),
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
