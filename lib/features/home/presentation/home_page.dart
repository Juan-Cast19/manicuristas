
//Import Flutter
import 'package:flutter/material.dart';
//Import Navegacion

//Import Core
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/theme/app_text_styles.dart';
//Import Widgets
import 'widgets/upcoming_appointment_card.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _homeHeader(),
            const SizedBox(height: 24),
            _summaryCards(),
            const SizedBox(height: 32),
            _quickActions(),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Próximas citas',
                      style: AppTextStyles.title,
                    ),
                    GestureDetector(
                      onTap: () {
                        // luego aquí navegamos a la pantalla completa
                      },
                      child: Text(
                        'Ver todas',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                UpcomingAppointmentCard(
                  clientName: 'María López',
                  service: 'Uñas acrílicas',
                  date: 'Hoy',
                  time: '3:00 PM',
                  status: AppointmentStatus.confirmed,
                ),

                UpcomingAppointmentCard(
                  clientName: 'Ana Pérez',
                  service: 'Manicure + Gel',
                  date: 'Mañana',
                  time: '10:30 AM',
                  status: AppointmentStatus.pending,
                ),

              ],
            ),

          ],
        ),
      ),
    );
    }
    Widget _homeHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Avatar
        const CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(
            'https://i.pravatar.cc/150?img=47',
          ),
        ),
        const SizedBox(width: 12),

        // Texto saludo
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Buenos días, Sarah ✨',
                style: AppTextStyles.title,
              ),
              const SizedBox(height: 4),
              Text(
                'Lista para tus 8 citas de hoy',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),

        // Notificación con círculo
        Stack(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                ),
              ),
            ),

            // Badge
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
    Widget _summaryCards() {
    return Row(
      children: [
        // Ganancias de hoy
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primary.withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Ganancias hoy',
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '\$345.00',
                  style: AppTextStyles.title.copyWith(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '+15%',
                    style: AppTextStyles.caption.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 16),

        // Citas
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Citas',
                      style: AppTextStyles.caption,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 18,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '8',
                  style: AppTextStyles.title.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 8),
                Text(
                  '+2 nuevas',
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
    Widget _quickActions() {
    return GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    childAspectRatio: 1,
    children: const [
      QuickActionPastel(
        icon: Icons.event_available,
        label: 'Nueva reserva',
        backgroundColor: Color(0xFFFFE6F0),
        iconColor: Color(0xFFE91E63),
      ),
      QuickActionPastel(
        icon: Icons.calendar_today,
        label: 'Ver calendario',
        backgroundColor: Color(0xFFF1E9FF),
        iconColor: Color(0xFF7C4DFF),
      ),
      QuickActionPastel(
        icon: Icons.person_add_alt_1,
        label: 'Agregar cliente',
        backgroundColor: Color(0xFFE6F4FF),
        iconColor: Color(0xFF2979FF),
      ),
      QuickActionPastel(
        icon: Icons.home_work_outlined,
        label: 'Agregar servicio',
        backgroundColor: Color(0xFFE9FBEF),
        iconColor: Color(0xFF2E7D32),
        ),
      ],
    );
  }
  }
class QuickActionPastel extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color iconColor;

  const QuickActionPastel({
    super.key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 26,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w600,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}





