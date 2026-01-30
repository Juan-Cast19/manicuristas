//IMPORT FLUTTER
import 'package:flutter/material.dart';
//IMPORT CORE
import 'package:manicuristas/core/theme/app_colors.dart';


class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<_ServiceItem> _services = [
    _ServiceItem(
      name: 'Uñas acrílicas',
      duration: 90,
      price: 1500,
      isActive: true,
      icon: Icons.content_cut,
    ),
    _ServiceItem(
      name: 'Manicura Rusa',
      duration: 60,
      price: 1200,
      isActive: true,
      icon: Icons.brush,
    ),
    _ServiceItem(
      name: 'Pedicura Spa',
      duration: 45,
      price: 800,
      isActive: true,
      icon: Icons.spa,
    ),
    _ServiceItem(
      name: 'Retiro de Gel',
      duration: 20,
      price: 300,
      isActive: false,
      icon: Icons.cleaning_services,
    ),
    _ServiceItem(
      name: 'Diseño Personalizado',
      duration: 30,
      price: 500,
      isActive: true,
      icon: Icons.auto_fix_high,
    ),
  ];

  void _toggleService(int index, bool value) {
    setState(() {
      _services[index] = _services[index].copyWith(isActive: value);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          value ? 'Servicio activado' : 'Servicio desactivado',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _editService(_ServiceItem service) {
    // Aquí luego navegaremos a EditServicePage
    debugPrint('Editar servicio: ${service.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios'),
        leading: const BackButton(),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Crear nuevo servicio (más adelante)
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Gestión de Servicios',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Administra tus servicios y precios',
              style: TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: _services.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final service = _services[index];
                  final isDisabled = !service.isActive;

                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => _editService(service),
                    child: Opacity(
                      opacity: isDisabled ? 0.4 : 1,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.pink.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                service.icon,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    service.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${service.duration} min • RD\$${service.price}',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Switch(
                              value: service.isActive,
                              activeThumbColor: AppColors.primary,
                              onChanged: (value) =>
                                  _toggleService(index, value),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Modelo local temporal solo para esta pantalla
class _ServiceItem {
  final String name;
  final int duration;
  final int price;
  final bool isActive;
  final IconData icon;

  _ServiceItem({
    required this.name,
    required this.duration,
    required this.price,
    required this.isActive,
    required this.icon,
  });

  _ServiceItem copyWith({bool? isActive}) {
    return _ServiceItem(
      name: name,
      duration: duration,
      price: price,
      isActive: isActive ?? this.isActive,
      icon: icon,
    );
  }
}
