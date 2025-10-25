import 'package:flutter/material.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onPressed, required this.label});
  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        fixedSize: Size(100.w, 6.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(14.sp),
        ),
      ),
      child: AppText(text: label, color: Colors.white),
    );
  }
}
