import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manicuristas/features/services/domain/model/services_models.dart';

class CreateEditServicePage extends StatefulWidget {
  final Service? service;

  const CreateEditServicePage({super.key, this.service});

  @override
  State<CreateEditServicePage> createState() => _CreateEditServicePageState();
}

class _CreateEditServicePageState extends State<CreateEditServicePage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  String? _selectedCategory;
  int _duration = 30;
  bool _isActive = true;

  final _currencyFormat = NumberFormat.currency(
    locale: 'es_DO',
    symbol: 'RD\$ ',
    decimalDigits: 0,
  );

  final List<String> _categories = [
    'Manos',
    'Pies',
    'Acrílicas',
    'Gel',
    'Nail Art',
  ];

  bool get isEditing => widget.service != null;

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      final service = widget.service!;
      _nameController.text = service.name;
      _priceController.text = _currencyFormat.format(service.price);
      _selectedCategory = service.categoryId;
      _duration = service.durationMinutes;
      _isActive = service.isActive;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _onPriceChanged(String value) {
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.isEmpty) {
      _priceController.clear();
      return;
    }

    final number = int.parse(digitsOnly);
    _priceController.value = TextEditingValue(
      text: _currencyFormat.format(number),
      selection: TextSelection.collapsed(
        offset: _currencyFormat.format(number).length,
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final price =
        int.parse(_priceController.text.replaceAll(RegExp(r'\D'), ''));

    final service = Service(
      id: widget.service?.id ?? UniqueKey().toString(),
      name: _nameController.text.trim(),
      categoryId: _selectedCategory!,
      price: price,
      durationMinutes: _duration,
      isActive: _isActive,
    );

    // TODO: Guardar en backend / state management

    Navigator.pop(context, service);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar servicio' : 'Nuevo servicio'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            /// Nombre
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre del servicio',
              ),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Campo requerido' : null,
            ),

            const SizedBox(height: 16),

            /// Categoría
            DropdownButtonFormField<String>(
              initialValue: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Categoría',
              ),
              items: _categories
                  .map(
                    (c) => DropdownMenuItem(
                      value: c,
                      child: Text(c),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _selectedCategory = value),
              validator: (value) =>
                  value == null ? 'Selecciona una categoría' : null,
            ),

            const SizedBox(height: 16),

            /// Precio
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Precio',
              ),
              onChanged: _onPriceChanged,
              validator: (value) =>
                  value == null || value.isEmpty ? 'Campo requerido' : null,
            ),

            const SizedBox(height: 24),

            /// Duración
            Row(
              children: [
                const Text(
                  'Duración',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _duration > 15
                      ? () => setState(() => _duration -= 15)
                      : null,
                ),
                Text('$_duration min'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _duration < 240
                      ? () => setState(() => _duration += 15)
                      : null,
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// Activo
            SwitchListTile(
              title: const Text('Servicio activo'),
              value: _isActive,
              onChanged: (value) => setState(() => _isActive = value),
            ),

            const SizedBox(height: 32),

            /// Botón
            ElevatedButton(
              onPressed: _submit,
              child: Text(
                isEditing ? 'Guardar cambios' : 'Crear servicio',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
