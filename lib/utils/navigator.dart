import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void pushTo(BuildContext context, Widget widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void pushReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void  pushAndRemoveUntil(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false,
  );
}

void back(BuildContext context) {
  Navigator.pop(context);
}
