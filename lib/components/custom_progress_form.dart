import 'package:flutter/material.dart';
import 'package:ganadolink_app/extensions/space_exs.dart';

class ProgressForm extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const ProgressForm({
    super.key,
    required this.text,
    required this.icon,
    this.color = const Color(0xffF27D16),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                color: color,
              ),
              child: Icon(
                icon,
                size: 12,
                color: Colors.white,
              ),
            ),
            8.w,
            Text(
              text,
              style: const TextStyle(fontFamily: 'Poppins', fontSize: 12),
            ),
          ],
        ),
        8.w,
      ],
    );
  }
}
