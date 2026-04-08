import 'package:flutter/material.dart';

class ARScreen extends StatelessWidget {
  const ARScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AR View")),
      body: Stack(
        children: [
          Container(color: Colors.black),
          Positioned(
            top: 120,
            left: 50,
            child: Text(
              "⚠ Pollution HIGH",
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}