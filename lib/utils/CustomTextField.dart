import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final InputBorder? customBorder;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color errorColor;
  final Color primaryColor;
  final String? Function(String?)? validator;

  AppTextField({
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.customBorder,
    this.prefixIcon,
    this.suffixIcon,
    this.errorColor = Colors.red,
    this.primaryColor = Colors.blue,
    this.validator,
    required InputDecoration decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,

      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: customBorder,
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: primaryColor) : null,
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, color: primaryColor) : null,
        focusedBorder: OutlineInputBorder().copyWith(
          borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),
        errorBorder: OutlineInputBorder().copyWith(
          borderSide: BorderSide(color: errorColor, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder().copyWith(
          borderSide: BorderSide(color: errorColor, width: 2.0),
        ),
      ),
    );
  }
}
