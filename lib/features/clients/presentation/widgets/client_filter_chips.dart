//IMPORT FLUTTER
import 'package:flutter/material.dart';
//IMPORT CORE
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/theme/app_text_styles.dart';

/// Filtros disponibles para clientes
enum ClientsFilter {
  todos,
  recurrentes,
  conCitas,
}

class ClientsFilterChips extends StatelessWidget {
  final ClientsFilter selectedFilter;
  final ValueChanged<ClientsFilter> onChanged;

  const ClientsFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ClientsFilter.values.map((filter) {
        final bool isSelected = filter == selectedFilter;

        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            label: Text(
              _labelForFilter(filter),
              style: AppTextStyles.bodySmall.copyWith(
                color: isSelected ? Colors.white : AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            selected: isSelected,
            selectedColor: AppColors.primary,
            backgroundColor: Colors.white,
            onSelected: (_) => onChanged(filter),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.border.withValues(alpha: 0.3),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _labelForFilter(ClientsFilter filter) {
    switch (filter) {
      case ClientsFilter.todos:
        return 'Todos';
      case ClientsFilter.recurrentes:
        return 'Recurrentes';
      case ClientsFilter.conCitas:
        return 'Con citas';
    }
  }
}
