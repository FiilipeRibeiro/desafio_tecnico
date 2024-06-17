import 'package:flutter/material.dart';

class DesafioApp extends StatelessWidget {
  const DesafioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Técnico',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Placeholder(),
    );
  }
}
