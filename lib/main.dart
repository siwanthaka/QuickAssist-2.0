import 'package:flutter/material.dart';
import 'home/home_screen.dart';

void main() {
  runApp(const QuickAssistApp());
}

class QuickAssistApp extends StatelessWidget {
  const QuickAssistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Assist 2.0',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
      ),
      home: HomeScreen(), // ✅ IMPORTANT: NO const here
    );
  }
}
