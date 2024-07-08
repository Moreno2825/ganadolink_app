import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  final int flex;
  final Color backgroundColor;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Color textFieldColor;
  final String hintText;
  final Color hintTextColor;
  final InputBorder? inputBorder;

  const MySearchBar(
      {Key? key,
      this.flex = 5,
      required this.backgroundColor,
      required this.icon,
      required this.iconSize,
      required this.iconColor,
      required this.textFieldColor,
      required this.hintText,
      required this.hintTextColor, this.inputBorder})
      : super(key: key);

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Row(
            children: [
              const SizedBox(width: 10),
              Icon(
                widget.icon,
                size: widget.iconSize,
                color: widget.iconColor,
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: TextField(
                style: TextStyle(color: widget.textFieldColor),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle:
                      TextStyle(color: widget.hintTextColor.withOpacity(0.7)),
                  border: widget.inputBorder ?? InputBorder.none,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
