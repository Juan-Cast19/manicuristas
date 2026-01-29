// IMPORT FLUTTER
import 'package:flutter/material.dart';
// IMPORT CORE
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/theme/app_text_styles.dart';
//IMPORT FEATURES
import 'package:manicuristas/features/agenda/presentation/widgets/day_selector.dart';
import 'package:manicuristas/features/clients/domain/models/client_model.dart';


class NewReservationPage extends StatefulWidget {
  final Client? client;
  const NewReservationPage({
    super.key,
    this.client,
    });
  

  @override
  State<NewReservationPage> createState() => _NewReservationPageState();
}

class _NewReservationPageState extends State<NewReservationPage> {
  // ─────────────────────────────────────────────────────────────
  // ESTADO
  // ─────────────────────────────────────────────────────────────
  String? selectedClient;
  String? selectedService;
  DateTime selectedDate = DateTime.now();
  String? selectedHour;
  // ─────────────────────────────────────────────────────────────
  // ERRORES DE VALIDACIÓN
  // ─────────────────────────────────────────────────────────────
  bool clientError = false;
  bool serviceError = false;
  bool hourError = false;

  String errorMessage = '';
  

  final List<String> services = ['Gel Soft', 'Acrílicas', 'Pedicure'];

  final List<String> hours = ['09:00', '10:30', '12:00'];

  // ─────────────────────────────────────────────────────────────
  // HELPERS
  // ─────────────────────────────────────────────────────────────
  bool get canConfirm {
    clientError = selectedClient == null;
    serviceError = selectedService == null;
    hourError = selectedHour == null;

    if (clientError) {  
      errorMessage = 'Selecciona un cliente';
    } else if (serviceError) {
      errorMessage = 'Selecciona un servicio';
    } else if (hourError) {
      errorMessage = 'Elige una hora disponible';
    }

    return !clientError && !serviceError && !hourError;
  }


  // ─────────────────────────────────────────────────────────────
  // UI
  // ─────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _clientSection(),
            const SizedBox(height: 24),
            _servicesSection(),
            const SizedBox(height: 24),
            _dateTimeSection(),
            const SizedBox(height: 24),
            _summarySection(),
            const SizedBox(height: 24),
            _confirmButton(),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // APP BAR
  // ─────────────────────────────────────────────────────────────
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.background,
      leading: IconButton(
        icon: const Icon(Icons.close, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text('Nueva Reserva', style: AppTextStyles.title),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Ayuda',
            style: AppTextStyles.bodyBold.copyWith(color: AppColors.primary),
          ),
          
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────
  // CLIENTE
  // ─────────────────────────────────────────────────────────────
  Widget _clientSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cliente', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 12),
        _clientSearch(),
        if (selectedClient != null) ...[
          const SizedBox(height: 12),
          _selectedClientCard(),
        ],
      ],
    );
  }

  Widget _clientSearch() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            readOnly: true,
            onTap: () {
              setState(() {
                selectedClient = 'Lucía Fernández';
              });
            },
            decoration: InputDecoration(
              hintText: 'Buscar cliente...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                  color: clientError ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          child: Icon(Icons.person_add, color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _selectedClientCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 24, child: Icon(Icons.person)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(selectedClient!, style: AppTextStyles.bodyBold),
                Text(
                  '+34 612 345 678',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: Colors.green),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // SERVICIOS
  // ─────────────────────────────────────────────────────────────
  Widget _servicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Servicios', style: AppTextStyles.sectionTitle),
            const Spacer(),
            Text(
              'Ver todos',
              style: AppTextStyles.caption.copyWith(color: AppColors.primary),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: services.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final service = services[index];
              final isSelected = selectedService == service;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedService = service;
                  });
                },
                child: Container(
                  width: 160,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: serviceError && !isSelected
                          ? Colors.red
                          : AppColors.primary.withValues(alpha: 0.3),
                    ),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.cut,
                        color: isSelected ? Colors.white : AppColors.primary,
                      ),
                      const Spacer(),
                      Text(
                        service,
                        style: AppTextStyles.bodyBold.copyWith(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        '60 min',
                        style: AppTextStyles.caption.copyWith(
                          color: isSelected ? Colors.white70 : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '€35.00',
                        style: AppTextStyles.bodyBold.copyWith(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────
  // FECHA Y HORA
  // ─────────────────────────────────────────────────────────────
  Widget _dateTimeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        Text('Fecha y Hora', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 12),
        const DaySelector(),
        const SizedBox(height: 16),
        Row(
          children: hours.map((hour) {
            final isSelected = selectedHour == hour;
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ChoiceChip(
                label: Text(hour),
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    selectedHour = hour;
                  });
                },
                shape: StadiumBorder(
                ),
                side: BorderSide(
                  color: hourError && !isSelected ? Colors.red : Colors.transparent,
                ),
                selectedColor: AppColors.primary,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────
  // RESUMEN
  // ─────────────────────────────────────────────────────────────
  Widget _summarySection() {
    if (!canConfirm) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RESUMEN DE RESERVA',
          style: AppTextStyles.caption.copyWith(letterSpacing: 1.2),
        ),
        const SizedBox(height: 8),
        Text(
          '$selectedClient · $selectedService',
          style: AppTextStyles.bodyBold,
        ),
        Text('Mar 13, $selectedHour (60 min)', style: AppTextStyles.caption),
        const SizedBox(height: 8),
        Text('€35.00', style: AppTextStyles.title),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────
  // BOTÓN
  // ─────────────────────────────────────────────────────────────
  Widget _confirmButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
      onPressed: () {
        setState(() {});

        if (!canConfirm) {
          _showErrorDialog(errorMessage);
          return;
        }

        _showSuccessDialog();
      },

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: const Text(
          'Confirmar Reserva',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

    void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 64,
                ),
                const SizedBox(height: 16),
                Text(
                  '¡Reserva confirmada!',
                  style: AppTextStyles.title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'La cita fue creada correctamente.',
                  style: AppTextStyles.caption,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // cierra el dialog
                      Navigator.pop(context); // vuelve atrás
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Aceptar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 64,
                ),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: AppTextStyles.caption,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Entendido',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
}
