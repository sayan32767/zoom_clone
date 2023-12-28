import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData(
        colorSchemeSeed: Colors.yellow,
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen()
      },
    );
  }
}
