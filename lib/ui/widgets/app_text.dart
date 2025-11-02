import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:sizer/sizer.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.color = Palette.black,
    this.fontWeight,
    this.fontSize = 15,
  });
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double fontSize;

  factory AppText.regular({
    required String text,
    Color? color,
    double fontSize = 15,
  }) {
    return AppText(
      text: text,
      color: color,
      fontWeight: FontWeight.normal,
      fontSize: fontSize,
    );
  }

  factory AppText.bold({
    required String text,
    Color? color,
    double fontSize = 15,
  }) {
    return AppText(
      text: text,
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize.sp,
      ),
    );
  }
}
