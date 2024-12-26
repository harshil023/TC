import 'package:flutter/material.dart';

import 'color_constants.dart';

class ButtonStyles{
  static ButtonStyle buttonStyleBlue({
    Color backgroundColor = ColorConstants.blue,
    Color foregroundColor = ColorConstants.blue,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    double elevation = 4.0,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: padding,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
    );
  }
}