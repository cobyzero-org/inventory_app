import 'package:flutter/material.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    Key? key,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.hintText,
  }) : super(key: key);
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: widget.label,
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 1.h),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.sp),
            ),
          ),
          keyboardType: widget.keyboardType,
        ),
      ],
    );
  }
}
