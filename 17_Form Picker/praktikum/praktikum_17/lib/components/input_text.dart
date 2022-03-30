import 'package:flutter/material.dart';

import '../themes/theme.dart';

class InputText extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  String? errorText;

  InputText({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.keyboardType,
    this.errorText,
  }) : super(key: key);

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: silverColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primaryColor, width: 1.5),
      ),
      child: TextField(
        minLines: 1,
        maxLines: 5,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        style: headingTextStyle.copyWith(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          isDense: true,
          hintText: widget.hintText,
          hintStyle: titleTextStyle.copyWith(
            color: greyColor,
            fontSize: 14,
          ),
          errorText: widget.errorText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
