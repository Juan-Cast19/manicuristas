import 'package:flutter/material.dart';

class ManicuristasApp extends StatelessWidget {
  const ManicuristasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manicuristas',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Text(
            'Manicuristas App',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
