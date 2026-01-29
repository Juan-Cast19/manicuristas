//Import Flutter
import 'package:flutter/material.dart';
//Import Core
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/theme/app_text_styles.dart';
//Import Agenda



class DayCard extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;

  const DayCard({
    super.key, 
    required this.day,
    required this.date,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: AppTextStyles.caption.copyWith(
              color: isSelected ? Colors.white : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: AppTextStyles.bodyBold.copyWith(
              color: isSelected ? Colors.white : AppColors.textPrimary,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
