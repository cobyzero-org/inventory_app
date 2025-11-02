import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.white,
      elevation: 1,
      shadowColor: Palette.gray.withValues(alpha: 0.5),
      toolbarHeight: 8.h,
      title: Row(
        children: [
          Container(
            width: 13.w,
            height: 13.w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Palette.background,
              borderRadius: BorderRadius.circular(Constants.radius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: icon,
          ),
          SizedBox(width: 4.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.bold(text: title, fontSize: 16),
              AppText.regular(text: subtitle, fontSize: 14),
            ],
          ),
        ],
      ),
      leading: SizedBox.shrink(),
      leadingWidth: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(8.h);
}
