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
    this.maxLines,
    this.overflow,
  });
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double fontSize;
  final int? maxLines;
  final TextOverflow? overflow;

  factory AppText.regular({
    required String text,
    Color? color,
    double fontSize = 15,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return AppText(
      text: text,
      color: color,
      fontWeight: FontWeight.normal,
      fontSize: fontSize,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory AppText.bold({
    required String text,
    Color? color,
    double fontSize = 15,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return AppText(
      text: text,
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      maxLines: maxLines,
      overflow: overflow,
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
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
