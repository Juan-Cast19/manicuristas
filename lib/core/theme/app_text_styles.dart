import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static const heading = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const bodyMedium = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle bodyBold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  static const bodySmall = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
  static const TextStyle caption = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
  static const TextStyle section = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 13,
  fontWeight: FontWeight.w600,
  letterSpacing: 1.1,
  color: AppColors.textSecondary,
  );
  static const TextStyle sectionTitle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: AppColors.textPrimary,
  letterSpacing: 0.2,
  );
  static const TextStyle title = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 22,
  fontWeight: FontWeight.w600,
  color: AppColors.textPrimary,
  height: 1.2,
  );


}

