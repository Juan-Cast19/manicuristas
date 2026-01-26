
//Import Flutter
import 'package:flutter/material.dart';
//Import Navegacion

//Import Core
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/theme/app_text_styles.dart';
//Import Widgets
import 'package:manicuristas/features/home/presentation/widgets/upcoming_appointment_card.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.textPrimary,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Reservas',
          style: AppTextStyles.title,
        ),
      ),
      
      
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 16),

              // 🔹 Filtros por estado
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChipButton(
                        label: 'Todas',
                        selected: true,
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      FilterChipButton(
                        label: 'Pendientes',
                        selected: false,
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      FilterChipButton(
                        label: 'Confirmadas',
                        selected: false,
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      FilterChipButton(
                        label: 'Canceladas',
                        selected: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    FilterChipButton(
                      label: 'Hoy',
                      selected: true,
                      onTap: () {},
                    ),
                    const SizedBox(width: 8),
                    FilterChipButton(
                      label: 'Esta semana',
                      selected: false,
                      onTap: () {},
                    ),
                    const SizedBox(width: 8),
                    FilterChipButton(
                      label: 'Este mes',
                      selected: false,
                      onTap: () {},
                    ),
                  ],
                ),
              ),


              const SizedBox(height: 24),

              // 🔹 Listado
              Expanded(
                child: ListView.separated(
                  itemCount: 6,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return const UpcomingAppointmentCard(
                      clientName: 'María López',
                      service: 'Uñas Acrílicas',
                      date: 'Hoy',
                      time: '3:00 PM',
                      status: AppointmentStatus.confirmed,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}

class FilterChipButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const FilterChipButton({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: selected ? Colors.white : AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}


