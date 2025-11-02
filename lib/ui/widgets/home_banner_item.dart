import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class HomeBannerItem extends StatelessWidget {
  const HomeBannerItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 11.h,
      padding: EdgeInsets.symmetric(horizontal: Constants.padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Constants.radius),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.bold(
                  text: title,
                  fontSize: 16,
                  color: Palette.background,
                ),
                AppText.regular(
                  text: subtitle,
                  fontSize: 14,
                  color: Palette.background,
                ),
              ],
            ),
          ),
          SizedBox(width: 2.w),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(icon, color: color),
          ),
        ],
      ),
    );
  }
}
