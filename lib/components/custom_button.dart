import 'package:flutter/material.dart';
import 'package:ganadolink_app/utils/constant.dart';

class CustomButton extends StatelessWidget {
  ///! Text
  final String label;

  final Color? backColor;

  final TextStyle styledText;

  final void Function() onPressed;

  const CustomButton({
    required this.label,
    required this.onPressed,
    this.backColor = kPrimaryColor,
    this.styledText = const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins'
    ),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 319,
      height: 44,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: styledText,
        ),
      ),
    );
  }
}
