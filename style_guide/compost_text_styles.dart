import 'package:compost_footprint/style_guide/compost_colors.dart';
import 'package:flutter/material.dart';

class CompostTextStyles {
  static const TextStyle h1 = TextStyle(
    fontFamily: 'SFProDisplay',
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: CompostColors.compostText,
  );
  static const TextStyle h3 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: CompostColors.compostText,
  );
  static const TextStyle h4 = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: CompostColors.greenText,
  );
  // paragraph style
  static const TextStyle body = TextStyle(
    fontFamily: 'SFProText',
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: CompostColors.compostTextSecondary,
  );
}
