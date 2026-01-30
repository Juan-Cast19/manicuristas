//IMPORT FLUTTER
import 'package:flutter/material.dart';
//IMPORT NAVEGATION
import 'package:manicuristas/features/services/presentation/services_page.dart';
//IMPORT CORE
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/theme/app_text_styles.dart';
import 'package:manicuristas/core/widgets/more_option_tile.dart';
import 'package:manicuristas/core/routers/app_routes.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Más', style: AppTextStyles.heading),
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
                    onPressed: () {},
                  )
                ],
              ),

              const SizedBox(height: 20),

              // Opciones
              MoreOptionTile(
                icon: Icons.brush,
                title: 'Servicios',
                subtitle: 'Gestiona los servicios y precios',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ServicesPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),

              MoreOptionTile(
                icon: Icons.message,
                title: 'Mensajes',
                subtitle: 'Mensajes automáticos y personalizados',
                onTap: () {},
              ),
              const SizedBox(height: 12),

              MoreOptionTile(
                icon: Icons.bar_chart,
                title: 'Reportes',
                subtitle: 'Consulta ingresos y rendimiento',
                onTap: () {},
              ),
              const SizedBox(height: 12),

              MoreOptionTile(
                icon: Icons.settings,
                title: 'Ajustes',
                subtitle: 'Configuración general',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.settings);
                },
              ),

              const SizedBox(height: 24),

              // PRO
              MoreOptionTile(
                icon: Icons.group,
                title: 'Personal',
                subtitle: 'Gestiona tu equipo de trabajo',
                onTap: () {
                  // luego validamos el plan
                  Navigator.pushNamed(context, AppRoutes.personal);
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'PRO',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.lock),
                  ],
                ),
              ),

              const Spacer(),

              // Ayuda
              Text('AYUDA', style: AppTextStyles.section),
              const SizedBox(height: 12),

              MoreOptionTile(
                icon: Icons.help_outline,
                title: 'Centro de ayuda',
                subtitle: 'Preguntas frecuentes y soporte',
                onTap: () {},
              ),

              const SizedBox(height: 20),

              Center(
                child: Text(
                  'NailTech Business v2.4.0',
                  style: AppTextStyles.caption,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

