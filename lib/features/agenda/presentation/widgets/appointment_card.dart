import 'package:flutter/material.dart';
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/theme/app_text_styles.dart';

class AppointmentCard extends StatelessWidget {
  final String clientName;
  final String service;
  final String timeRange;
  final Color color;

  const AppointmentCard({
    super.key,
    required this.clientName,
    required this.service,
    required this.timeRange,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border(
          left: BorderSide(
            color: color,
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            clientName,
            style: AppTextStyles.bodyBold,
          ),
          const SizedBox(height: 4),
          Text(
            service,
            style: AppTextStyles.bodyMedium.copyWith(color: color),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.access_time,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                timeRange,
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
