import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ElevateButtonIcon extends StatelessWidget {
  final double height;
  final double width;
  final IconData? icon;
  final double sizeIcon;
  final Color colorIcon;
  final String label;
  final double labelSize;
  final Color labelColor;
  final Color buttonColor;
  final VoidCallback? onTap; 

  const ElevateButtonIcon({
    Key? key,
    this.height = 58,
    this.icon,
    this.sizeIcon = 25,
    this.colorIcon = Colors.blue,
    this.width = 115,
    required this.label,
    required this.labelColor,
    required this.buttonColor,
    this.onTap, // Marcar como opcional
    this.labelSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        onPressed: onTap != null ? () => onTap!() : null,
        icon: icon != null
            ? Icon(
                icon,
                size: sizeIcon,
                color: colorIcon,
              )
            : null,
        label: Text(
          label,
          style: TextStyle(
            fontSize: labelSize,
            color: labelColor,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}

