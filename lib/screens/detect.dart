import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/ai.dart';

class DetectScreen extends StatefulWidget {
  const DetectScreen({super.key});

  @override
  State<DetectScreen> createState() => _DetectScreenState();
}

class _DetectScreenState extends State<DetectScreen> {
  String result = "";
  final picker = ImagePicker();

  Future pickImage() async {
    await picker.pickImage(source: ImageSource.camera);

    final res = AIService.detect();

    setState(() {
      result = "Type: ${res['type']}\nConfidence: ${res['confidence']}%";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Detection")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickImage,
              child: const Text("Capture & Detect"),
            ),
            const SizedBox(height: 20),
            Text(result, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}