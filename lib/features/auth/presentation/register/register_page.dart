import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isManicurista = true;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Registro'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Crea tu cuenta',
              style: TextStyle(
                fontSize: 28, 
                fontWeight: FontWeight.w700), //Blod
            ),
            const SizedBox(height: 8),
            const Text(
              'Comienza a organizar tu negocio hoy',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 32),

            _label('Nombre completo'),
            _input('Ej. Ana García'),

            _label('Correo electrónico'),
            _input('ejemplo@correo.com'),

            _label('Contraseña'),
            _passwordInput('Mínimo 8 caracteres'),

            _label('Confirmar contraseña'),
            _input('Repite tu contraseña', obscure: true),

            const SizedBox(height: 24),
            const Divider(),

            const SizedBox(height: 16),
            const Text(
              'Información básica del negocio',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              '(Opcional)',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 16),

            _label('Nombre del negocio'),
            _input('Ej. Nails & Art Studio'),

            _label('Tipo de negocio'),
            const SizedBox(height: 8),

            Row(
              children: [
                _businessTypeButton('Manicurista', isManicurista, () {
                  setState(() => isManicurista = true);
                }),
                const SizedBox(width: 12),
                _businessTypeButton('Salón', !isManicurista, () {
                  setState(() => isManicurista = false);
                }),
              ],
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: 'Registrarme',
                onPressed: () {},
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿Ya tienes cuenta?'),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Inicia sesión',
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  Widget _input(String hint, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }

  Widget _passwordInput(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        obscureText: !showPassword,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: IconButton(
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() => showPassword = !showPassword);
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }

  Widget _businessTypeButton(
    String text,
    bool selected,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: selected ? Colors.pink : Colors.transparent,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.pink),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
