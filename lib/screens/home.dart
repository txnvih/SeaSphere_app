import 'package:flutter/material.dart';
import 'detect.dart';
import 'prediction.dart';
import 'ar.dart';
import 'community.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget button(BuildContext context, String text, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => page),
      ),
      child: Card(
        elevation: 4,
        child: Center(child: Text(text, style: TextStyle(fontSize: 18))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SeaSphere")),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          button(context, "AI Detection", DetectScreen()),
          button(context, "Prediction", PredictionScreen()),
          button(context, "AR View", ARScreen()),
          button(context, "Community", CommunityScreen()),
        ],
      ),
    );
  }
}