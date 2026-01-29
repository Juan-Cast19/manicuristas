//Import Flutter
import 'package:flutter/material.dart';
//Import Navegacion
import 'package:manicuristas/features/auth/presentation/register/register_page.dart';
import 'package:manicuristas/features/auth/presentation/forgot_password/forgot_password_page.dart';
import 'package:manicuristas/features/navigation/presentation/main_navigation_page.dart';
//Import Core
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/widgets/primary_button.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool mantenerSesion = false;
  bool ocultarContrasena = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Icono
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.pink.shade50,
                child: const Icon(
                  Icons.brush,
                  color: Colors.pink,
                  size: 36,
                ),
              ),

              const SizedBox(height: 24),

              // Título
              const Text(
                'Bienvenida',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // Subtítulo
              Text(
                'Gestiona tu negocio de manicura con facilidad',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 32),

              // Correo o teléfono
              _InputLabel(texto: 'Correo o teléfono'),
              const SizedBox(height: 8),
              TextField(
                decoration: _inputDecoration(
                  hint: 'ejemplo@correo.com',
                ),
              ),

              const SizedBox(height: 20),

              // Contraseña
              _InputLabel(texto: 'Contraseña'),
              const SizedBox(height: 8),
              TextField(
                obscureText: ocultarContrasena,
                decoration: _inputDecoration(
                  hint: '••••••••',
                  suffixIcon: IconButton(
                    icon: Icon(
                      ocultarContrasena
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        ocultarContrasena = !ocultarContrasena;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Mantener sesión + Olvidaste contraseña
              Row(
                children: [
                  Checkbox(
                    value: mantenerSesion,
                    onChanged: (value) {
                      setState(() {
                        mantenerSesion = value ?? false;
                      });
                    },
                  ),
                  const Text('Mantener sesión'),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Botón iniciar sesión
              SizedBox(
                width: double.infinity,
                height: 50,
                child: PrimaryButton(
                  text: 'Iniciar sesión',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MainNavigationPage(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 32),

              // Crear cuenta
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('¿No tienes una cuenta?'),
                  TextButton(
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterPage(),
                          ),
                        );
                      },
                    child: const Text(
                      'Crear una cuenta',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ],
              ),
              
              
            ],
            
          ),
          
        ),
      ),
    );
  }

  // Decoración reutilizable para inputs
  InputDecoration _inputDecoration({
    required String hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      suffixIcon: suffixIcon,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.pink),
      ),
    );
  }
}

// Widget para labels
class _InputLabel extends StatelessWidget {
  final String texto;

  const _InputLabel({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
