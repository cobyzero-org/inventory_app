import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:sizer/sizer.dart';

class HomeBannerItem extends StatelessWidget {
  const HomeBannerItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 11.h,
      padding: EdgeInsets.symmetric(horizontal: Constants.padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Constants.radius),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 2.w),
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(icon, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
