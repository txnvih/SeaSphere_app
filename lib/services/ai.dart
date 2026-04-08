import 'dart:math';

class AIService {
  static Map<String, dynamic> detect() {
    final types = ["Oil Spill", "Clean Water", "Plastic Waste"];
    return {
      "type": types[Random().nextInt(types.length)],
      "confidence": (Random().nextDouble() * 100).toStringAsFixed(2)
    };
  }
}