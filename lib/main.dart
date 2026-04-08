import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const SeaSphere());
}

class SeaSphere extends StatelessWidget {
  const SeaSphere({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeaSphere',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}