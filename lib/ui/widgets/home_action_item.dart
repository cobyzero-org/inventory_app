import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class HomeActionItem extends StatelessWidget {
  const HomeActionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });
  final IconData icon;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Palette.white,
        border: Border.all(color: Palette.border),
        borderRadius: BorderRadius.circular(Constants.radius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: color,
            child: Icon(icon, color: Palette.background),
          ),
          SizedBox(height: .5.h),
          AppText.bold(text: title, fontSize: 16),
        ],
      ),
    );
  }
}
