import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String text,
  bool success = false,
}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: success ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16.sp);
}
