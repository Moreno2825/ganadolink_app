import 'package:flutter/material.dart';

class ButtonIconTransparent extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String text;
  final VoidCallback onPressed;
  final bool showBorder; // Parámetro opcional para el borde

  const ButtonIconTransparent({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.text,
    required this.onPressed,
    this.showBorder = true, // Valor por defecto
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45,
        width: 65,
        decoration: BoxDecoration(
          color: Colors.white24,
          border: showBorder
              ? Border(
                  left: BorderSide(
                    color: Colors.orange.withOpacity(0.2),
                    width: 2,
                  ),
                )
              : null, // Sin borde si showBorder es false
        ),
        child: Center(
          child: Column(
            children: [
              Icon(
                icon,
                size: iconSize,
                color: Colors.orange.shade200,
              ),
              const SizedBox(height: 5),
              Text(
                text,
                style: TextStyle(color: Colors.orange.shade200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
