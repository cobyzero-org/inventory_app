import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class NavigatorItem extends StatelessWidget {
  const NavigatorItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18.sp,
                color: isSelected ? Palette.primary : Colors.grey,
              ),
              SizedBox(height: 1.h),
              AppText.regular(
                text: title,
                fontSize: 14,
                color: isSelected ? Palette.primary : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
