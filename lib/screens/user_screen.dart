import 'package:flutter/material.dart';
import 'package:ganadolink_app/utils/responsive.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    Responsive resp = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cuenta',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {},
          color: const Color.fromARGB(204, 90, 90, 90),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: resp.width,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              decoration: const BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        NetworkImage('https://randomuser.me/api/portraits/lego/1.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mariana Trujillo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        'marianatrujillo@gmail.com',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Información básica',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor:
                        WidgetStateProperty.all(const Color(0xFF0F4CA9)),
                    textStyle: WidgetStateProperty.all(
                      const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  child: const Text('Editar'),
                )
              ],
            ),
            const Text(
              'Configuración',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
