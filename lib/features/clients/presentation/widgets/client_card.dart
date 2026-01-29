// IMPORT FLUTTER
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// IMPORT FEATURES
import 'package:manicuristas/features/clients/domain/models/client_model.dart';
//IMPORT CORE
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/theme/app_text_styles.dart';


class ClientCard extends StatelessWidget {
  final Client client;
  final VoidCallback onBook;

  const ClientCard({
    super.key,
    required this.client,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    final hasUpcoming =
        client.upcomingAppointments != null &&
        client.upcomingAppointments!.isNotEmpty;

    final nextAppointment =
        hasUpcoming ? client.upcomingAppointments!.first : null;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(client.avatar),
          ),

          const SizedBox(width: 12),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  client.name,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                // Próxima cita o teléfono
                Text(
                  hasUpcoming
                      ? _formatAppointment(nextAppointment!)
                      : client.phone,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                if (client.isRecurrent)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Recurrente',
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Botón Reservar
          ElevatedButton(
            onPressed: onBook,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
            child: const Text('Reservar'),
          ),
        ],
      ),
    );
  }

  String _formatAppointment(Appointment appointment) {
    final date = DateFormat('dd MMM').format(appointment.date);
    final time = DateFormat('hh:mm a').format(appointment.date);
    return '${appointment.service} · $date · $time';
  }
}