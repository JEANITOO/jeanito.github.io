import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora Responsiva',
      home: Scaffold(
        appBar: AppBar(title: const Text('Calculadora')),
        body: Center(
          child: Text(
            'Calculadora na Web',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
