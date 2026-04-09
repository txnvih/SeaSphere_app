import 'package:flutter/material.dart';
import 'screens/map_screen.dart';

void main() {
  runApp(const SeaSphereApp());
}

class SeaSphereApp extends StatelessWidget {
  const SeaSphereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SeaSphere',
      home: const MapScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // your base color
      appBar: AppBar(
        title: const Text('SeaSphere'),
        backgroundColor: Colors.blue, // change to your theme
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ✅ LOGO (safe loading)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/seaspherelogo.png',
                  height: 120,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      'Logo failed to load',
                      style: TextStyle(color: Colors.red),
                    );
                  },
                ),
              ),

              // ✅ TITLE
              const Text(
                "Water Pollution Tracker",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // ✅ SAMPLE CONTENT BOX
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text("Map / Content will go here"),
                ),
              ),

              const SizedBox(height: 20),

              // ✅ LEGEND (your colors)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Legend",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        circle(Colors.green),
                        const SizedBox(width: 8),
                        const Text("Low Pollution"),
                      ],
                    ),

                    Row(
                      children: [
                        circle(Colors.orange),
                        const SizedBox(width: 8),
                        const Text("Moderate"),
                      ],
                    ),

                    Row(
                      children: [
                        circle(Colors.red),
                        const SizedBox(width: 8),
                        const Text("High"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget circle(Color color) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}