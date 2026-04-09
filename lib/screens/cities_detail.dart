import 'package:flutter/material.dart';
import '../data/AllCities.dart';

class CityDetailsScreen extends StatelessWidget {
  final String cityId;

  const CityDetailsScreen({super.key, required this.cityId});

  @override
  Widget build(BuildContext context) {
    final city = allCities.firstWhere((c) => c.id == cityId);
    final data = getCityDetails(cityId);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(city.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🏙 CITY INFO
            Text(
              "${city.name}, ${city.state}",
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 8),

            Text(
              "Pollution: ${city.pollutionLevel.toUpperCase()} (Index ${city.pollutionIndex})",
              style: const TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 20),

            /// 🧪 SOURCES
            const Text("Pollution Sources", style: TextStyle(color: Colors.white, fontSize: 18)),
            ...data["sources"].map<Widget>((s) {
              return ListTile(
                title: Text(s["name"], style: const TextStyle(color: Colors.white)),
                trailing: Text("${s["value"]}%", style: const TextStyle(color: Colors.white70)),
              );
            }).toList(),

            const SizedBox(height: 20),

            /// 📈 MONTHLY
            const Text("Monthly Trend", style: TextStyle(color: Colors.white, fontSize: 18)),
            ...data["monthly"].map<Widget>((m) {
              return Text(
                "${m["month"]}: ${m["value"]}",
                style: const TextStyle(color: Colors.white70),
              );
            }).toList(),

            const SizedBox(height: 20),

            /// 📅 YEARLY
            const Text("Yearly Trend", style: TextStyle(color: Colors.white, fontSize: 18)),
            ...data["yearly"].map<Widget>((y) {
              return Text(
                "${y["year"]}: ${y["value"]}",
                style: const TextStyle(color: Colors.white70),
              );
            }).toList(),

            const SizedBox(height: 20),

            /// 🖼 IMAGES
            const Text("Images", style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: (data["images"] as List).map<Widget>((img) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(img),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            /// 🔗 REFERENCES
            const Text("References", style: TextStyle(color: Colors.white, fontSize: 18)),
            ...data["references"].map<Widget>((r) {
              return Text(
                r["title"],
                style: const TextStyle(color: Colors.blue),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}