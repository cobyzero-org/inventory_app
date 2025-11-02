import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:sizer/sizer.dart';
import 'package:inventory_app/core/utils/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onPressed, required this.label});
  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Palette.primary,
        fixedSize: Size(100.w, 3.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(Constants.radius),
        ),
      ),
      child: AppText(text: label, color: Colors.white),
    );
  }
}
