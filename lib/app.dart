import 'package:flutter/material.dart';
import 'features/splash/presentation/splash_page.dart';

class ManicuristasApp extends StatelessWidget {
  const ManicuristasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
