
//Import Flutter
import 'package:flutter/material.dart';
//Import Navegacion

//Import Core
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/theme/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: Text(
          'Manicuristas',
          style: AppTextStyles.heading,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hola 👋',
              style: AppTextStyles.heading,
            ),
            const SizedBox(height: 8),
            Text(
              'Gestiona tus citas y clientas fácilmente',
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: 24),

            // Card placeholder
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: AppColors.background2,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Próximamente: Agenda',
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
