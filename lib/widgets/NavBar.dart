import 'package:flutter/material.dart';
import 'package:ganadolink_app/components/screens/Catalogue.dart';
import 'package:ganadolink_app/components/screens/Home.dart';
import 'package:ganadolink_app/components/screens/Users.dart';

class NavbarWidget extends StatefulWidget {
  final List<String> routes;
  final List<IconData> icons;

  const NavbarWidget({
    Key? key,
    required this.routes,
    required this.icons,
  }) : super(key: key);

  @override
  _NavbarWidgetState createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
