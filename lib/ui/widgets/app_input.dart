import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    super.key,
    this.controller,
    this.label,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.hintText,
    this.prefixIcon,
  });
  final TextEditingController? controller;
  final String? label;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final Icon? prefixIcon;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          AppText(
            text: widget.label ?? "",
            color: Palette.gray,
            fontWeight: FontWeight.bold,
          ),
        if (widget.label != null) SizedBox(height: 1.h),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            filled: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 1.h,
              horizontal: 2.w,
            ),
            fillColor: Palette.fill,
            isDense: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Palette.gray.withValues(alpha: 0.5)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(Constants.radius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.primary, width: 3),
              borderRadius: BorderRadius.circular(Constants.radius),
            ),
          ),
          keyboardType: widget.keyboardType,
        ),
      ],
    );
  }
}
