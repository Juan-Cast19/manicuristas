//Import Flutter
import 'package:flutter/material.dart';
//Import Core

import 'app_routes.dart';
// pantallas
import 'package:manicuristas/features/home/presentation/home_page.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
/*
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
*/
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Ruta no encontrada')),
          ),
        );
    }
  }
}
