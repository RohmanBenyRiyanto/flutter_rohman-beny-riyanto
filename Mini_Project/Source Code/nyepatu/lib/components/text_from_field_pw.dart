// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/theme.dart';

class CostumTextFromFieldPW extends StatefulWidget {
  CostumTextFromFieldPW({
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
  State<CostumTextFromFieldPW> createState() => _CostumTextFromFieldPWState();
}

class _CostumTextFromFieldPWState extends State<CostumTextFromFieldPW> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isHidden == true ? true : false,
      maxLines: 1,
      controller: widget.controllers,
      keyboardType: widget.keyboardTypes,
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
        hintText: widget.hintTexts,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: GestureDetector(
          onTap: () => _toggleVisibility(),
          child: SizedBox(
            height: 12,
            width: 12,
            child: SvgPicture.asset(
              _isHidden
                  ? 'assets/icons/ic_hide_pw.svg'
                  : 'assets/icons/ic_show_pw.svg',
              color: blackOneColor,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      validator: widget.validators,
      onSaved: widget.onChangeds,
    );
  }
}
