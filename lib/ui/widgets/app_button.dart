import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onPressed, required this.label});
  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: Size(double.maxFinite, 1)),
      child: Text(
        label,
        style: theme.textTheme.titleMedium!.copyWith(color: Colors.white),
      ),
    );
  }
}
