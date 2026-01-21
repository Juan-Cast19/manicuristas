import 'package:flutter/material.dart';
import 'features/splash/presentation/splash_page.dart';

class ManicuristasApp extends StatelessWidget {
  const ManicuristasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: SplashPage(),
    );
  }
}
