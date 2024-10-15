import 'package:flutter/material.dart';

class CustomTextButton {
  static customTextButton(VoidCallback onPressed, String title, Color color) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(overlayColor: Colors.transparent),
        child: Text(
          title,
          style: TextStyle(color: color),
        ));
  }
}
