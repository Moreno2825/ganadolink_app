// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final Color textColor;
  final TextEditingController textEditingController;
  final TextCapitalization textCapitalization;
  final FocusNode focusNode;
  final int maxLength;
  final bool isEnable;
  final bool obscureText;
  final String? Function(String? text) validator;
  final void Function(String text) onChanged;
  final void Function()? onTap;
  final bool required;
  final bool floatingLabel;
  final bool isViewPassword;
  final IconData? icon;

  const CustomTextField({
    super.key,
    required this.label,
    required this.textEditingController,
    required this.focusNode,
    this.maxLength = 20,
    this.isEnable = false,
    this.obscureText = false,
    required this.validator,
    required this.onChanged,
    this.onTap,
    this.icon,
    this.required = false,
    this.textCapitalization = TextCapitalization.none,
    this.textColor = const Color(0xFF9E9E9E),
    this.floatingLabel = true,
    this.isViewPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.floatingLabel)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        Container(
          height: 45,
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
          child: Container(
            padding: const EdgeInsets.only(top: 6),
            child: TextFormField(
              controller: widget.textEditingController,
              textCapitalization: widget.textCapitalization,
              readOnly: widget.isEnable,
              focusNode: widget.focusNode,
              maxLength: widget.maxLength,
              maxLines: 2,
              expands: false,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                prefixIcon: widget.icon != null
                    ? Icon(
                        widget.icon,
                        color: widget.focusNode.hasFocus ? Colors.black : Colors.grey,
                        size: 16,
                      )
                    : null,
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                hintText: widget.floatingLabel ? null : '',
                isCollapsed: true,
                contentPadding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                labelText: widget.floatingLabel ? (widget.label == '' ? null : widget.label) : null,
                counterText: '',
                labelStyle: TextStyle(
                  fontSize: 13,
                  color: widget.isEnable ? widget.textColor : widget.textColor,
                ),
              ),
              validator: widget.validator,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
            ),
          ),
        ),
      ],
    );
  }
}
