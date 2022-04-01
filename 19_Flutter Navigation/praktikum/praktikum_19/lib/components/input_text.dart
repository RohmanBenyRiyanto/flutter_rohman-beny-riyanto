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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: headingTextStyle.copyWith(
            fontSize: 14.0,
            fontWeight: bold,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Container(
          height: 45.0,
          decoration: BoxDecoration(
            color: silverColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            style: titleTextStyle.copyWith(
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
        ),
      ],
    );
  }
}
