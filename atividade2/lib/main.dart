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
      title: 'Aplicativo Responsivo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Layout Responsivo')),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return const Center(
                child: Text(
                  'Modo Mobile',
                  style: TextStyle(fontSize: 24),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'Modo Desktop',
                  style: TextStyle(fontSize: 32),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
