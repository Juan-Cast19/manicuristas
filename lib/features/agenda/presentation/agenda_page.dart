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
        foregroundColor: Colors.white,
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
                children: [
                  // 09:00
                  _TimelineRow(
                    time: '09:00 AM',
                    child: AppointmentCard(
                      clientName: 'Sarah Jenkins',
                      service: 'Acrylic Full Set',
                      timeRange: '09:00 AM - 10:30 AM (90m)',
                      color: AppColors.primary,
                    ),
                  ),

                  // 10:30
                  _TimelineRow(
                    time: '10:30 AM',
                    child: const AvailableSlot(),
                  ),

                  // 11:00
                  _TimelineRow(
                    time: '11:00 AM',
                    child: AppointmentCard(
                      clientName: 'Jessica White',
                      service: 'Gel Manicure + Art',
                      timeRange: '11:00 AM - 12:00 PM (60m)',
                      color: AppColors.info,
                    ),
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
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.calendar_today,
                    size: 26,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Marzo',
                  style: AppTextStyles.bodyBold.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            ],
          ),
          Row(
            children: [
              _HeaderIcon(icon: Icons.search),
              const SizedBox(width: 8),
              _HeaderIcon(icon: Icons.notifications_none),
            ],
          ),
        ],
      ),
    );
  }
}
class _HeaderIcon extends StatelessWidget {
  final IconData icon;

  const _HeaderIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: 20,
          color: AppColors.textPrimary,
        ),
        onPressed: () {},
      ),
    );
  }
}
class _TimelineRow extends StatelessWidget {
  final String time;
  final Widget child;

  const _TimelineRow({
    required this.time,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 72,
            child: TimeLabel(time: time),
          ),
          const SizedBox(width: 12),
          Expanded(child: child),
        ],
      ),
    );
  }
}

