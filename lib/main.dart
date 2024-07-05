import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:omniprotest/main_module.dart';

void main() {
  runApp(
    ModularApp(
      module: MainModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
