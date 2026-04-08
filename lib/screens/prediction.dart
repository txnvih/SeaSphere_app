import 'package:flutter/material.dart';
import '../services/prediction.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = PredictionService.predict();

    return Scaffold(
      appBar: AppBar(title: const Text("Predictions")),
      body: ListView(
        children: data.entries.map((e) {
          return ListTile(
            title: Text(e.key),
            subtitle: Text(e.value),
          );
        }).toList(),
      ),
    );
  }
}