import 'package:flutter/material.dart';
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/theme/app_text_styles.dart';
import 'widgets/day_selector.dart';
import 'widgets/appointment_card.dart';
import 'widgets/available_slot.dart';
import 'widgets/time_label.dart';

class AgendaPage extends StatelessWidget {
  const AgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background2,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _Header(),
            const SizedBox(height: 16),
            const DaySelector(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  TimeLabel(time: '09:00 AM'),
                  AppointmentCard(
                    clientName: 'Sarah Jenkins',
                    service: 'Acrylic Full Set',
                    timeRange: '09:00 AM - 10:30 AM (90m)',
                    color: AppColors.primary,
                  ),
                  TimeLabel(time: '10:30 AM'),
                  AvailableSlot(),
                  TimeLabel(time: '11:00 AM'),
                  AppointmentCard(
                    clientName: 'Jessica White',
                    service: 'Gel Manicure + Art',
                    timeRange: '11:00 AM - 12:00 PM (60m)',
                    color: AppColors.info,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Agenda',
                style: AppTextStyles.section,
              ),
              const SizedBox(height: 4),
              Text(
                'Marzo 2026',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

