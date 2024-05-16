import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  //
  final Widget? suffixIcon;
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
  const CustomTextField({
    super.key,
    this.suffixIcon,
    required this.label,
    required this.textEditingController,
    required this.focusNode,
    this.maxLength = 20,
    this.isEnable = false,
    this.obscureText = false,
    required this.validator,
    required this.onChanged,
    this.onTap,
    this.required = false,
    this.textCapitalization = TextCapitalization.none,
    this.textColor = const Color(0xFF9E9E9E),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        padding: const EdgeInsets.only(top: 13),
        child: TextFormField(
          controller: textEditingController,
          textCapitalization: textCapitalization,
          readOnly: isEnable,
          focusNode: focusNode,
          maxLength: maxLength,
          maxLines: 2,
          expands: false,
          decoration: InputDecoration(
            prefix: const SizedBox(),
            prefixStyle: const TextStyle(fontSize: 5),
            border: const OutlineInputBorder(),
            suffixIcon: suffixIcon,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: '',
            isCollapsed: false,
            contentPadding: const EdgeInsets.fromLTRB(10, 13, 0, 0),
            labelText: label == '' ? null : label,
            counterText: '',
            labelStyle: TextStyle(
              fontSize: 13,
              color: isEnable ? textColor : textColor,
            ),
          ),
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
        ),
      ),
    );
  }
}
