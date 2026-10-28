
import 'package:flutter/material.dart';
import 'features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const NexoFinanceApp());
}

class NexoFinanceApp extends StatelessWidget {
  const NexoFinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nexo Finance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF176B4D),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9F7),
      ),
      home: const LoginPage(),
    );
  }
}
