import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  static const TextStyle appNameStyle = TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 40,
    color: AppColors.primaryDark,
    letterSpacing: 1.5,
  );

  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );
}
