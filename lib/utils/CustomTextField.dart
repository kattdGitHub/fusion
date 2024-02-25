import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion/Theme/theme.dart';

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
    this.primaryColor = AppColors.primaryColor,
    this.validator,
    required InputDecoration decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
         disabledBorder: OutlineInputBorder().copyWith(
           borderRadius: BorderRadius.circular(15.r),
           borderSide: BorderSide(color: primaryColor, width: 2.0),
         ),enabledBorder: OutlineInputBorder().copyWith(
           borderRadius: BorderRadius.circular(15.r),
           borderSide: BorderSide(color: Colors.grey, width: 2.0),
         ),
          focusedBorder: OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          errorBorder: OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: errorColor, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: errorColor, width: 2.0),
          ),
        ),
      ),
    );
  }
}
