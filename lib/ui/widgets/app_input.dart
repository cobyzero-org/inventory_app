import 'package:flutter/material.dart';
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
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(widget.label ?? "", style: theme.textTheme.labelLarge),
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
            fillColor: theme.colorScheme.surface,
            isDense: true,
            hintText: widget.hintText,
            hintStyle: theme.textTheme.bodySmall,
          ),
          keyboardType: widget.keyboardType,
        ),
      ],
    );
  }
}
