import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    required this.label,
  });

  final List<String> items;
  final Function(String?) onChanged;
  final String? value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: label, color: Palette.gray, fontWeight: FontWeight.bold),
        SizedBox(height: 1.h),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constants.radius),
            color: Palette.fill,
          ),
          child: DropdownButton(
            underline: const SizedBox(),
            isExpanded: true,
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: onChanged,
            value: value,
          ),
        ),
      ],
    );
  }
}
