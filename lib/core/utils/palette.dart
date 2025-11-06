import 'package:flutter/material.dart';

class Palette {
  // Base
  static const background = Color(0xFFf6fafe);
  static const black = Color(0xFF101828);
  static const primary = Color(0xFF1a67fe);
  static const gray = Color(0xFF6d7485);
  static const white = Color(0xFFFFFFFF);
  // Charts
  static const chart1 = Color(0xFF0EA5E9);
  static const chart2 = Color(0xFF22C55E);
  static const chart3 = Color(0xFFF59E0B);
  static const chart4 = Color(0xFF8B5CF6);

  static final border = Palette.gray.withValues(alpha: 0.3);
  static final fill = primary.withValues(alpha: 0.1);
  static const greenOpacity = Color(0xFFDBFCE7);
  static const redOpacity = Color(0xFFFEE2E3);
  static const green = Color(0xFF017A95);
  static const red = Color(0xFFC01D12);
}
