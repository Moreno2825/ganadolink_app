import 'package:flutter/material.dart';

class SquareButton extends StatefulWidget {
  final VoidCallback onTap;
  final int flex;
  final double width;
  final double iconSize;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const SquareButton({
    Key? key,
    required this.onTap,
    this.flex = 0,
    required this.iconSize,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,  this.width = 50,
  }) : super(key: key);

  @override
  State<SquareButton> createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: widget.flex,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            height: 50,
            width: widget.width,
            child: Center(
              child: Icon(
                widget.icon,
                size: widget.iconSize,
                color: widget.iconColor,
              ),
            ),
          ),
        ));
  }
}
