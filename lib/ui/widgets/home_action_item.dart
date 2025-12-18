import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:sizer/sizer.dart';

class HomeActionItem extends StatelessWidget {
  const HomeActionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final Color color;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(Constants.radius),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
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
            Text(title, style: theme.textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
