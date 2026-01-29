//IMPORT FLUTTER
import 'package:flutter/material.dart';
//IMPORT CORE
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/theme/app_text_styles.dart';

class SearchInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hintText;

  const SearchInput({
    super.key,
    this.onChanged,
    this.hintText = 'Buscar cliente',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: AppTextStyles.body,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.body.copyWith(
          color: AppColors.textSecondary,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.textSecondary,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

