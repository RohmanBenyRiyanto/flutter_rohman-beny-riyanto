// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../themes/theme.dart';

class CostumTextFromField extends StatelessWidget {
  CostumTextFromField({
    Key? key,
    this.controllers,
    this.keyboardTypes,
    this.hintTexts,
    this.validators,
    this.onChangeds,
  }) : super(key: key);

  TextEditingController? controllers;
  TextInputType? keyboardTypes;
  String? hintTexts;
  String? Function(String?)? validators;
  Function(String?)? onChangeds;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: controllers,
      keyboardType: keyboardTypes,
      style: blackTextStyle.copyWith(
        fontSize: 14.0,
        fontWeight: medium,
      ),
      decoration: InputDecoration(
        fillColor: cardBGColor,
        filled: true,
        hintStyle: blackTwoTextStyle.copyWith(
          fontSize: 14.0,
          fontWeight: regular,
        ),
        errorStyle: redTextStyle.copyWith(
          fontSize: 12.0,
          fontWeight: regular,
        ),
        hintText: hintTexts,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      validator: validators,
      onSaved: onChangeds,
    );
  }
}
