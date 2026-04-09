import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/globe.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String filterType = 'all';

  List<dynamic> cityRiskData = [];
  bool isLoading = true;

  // 🔥 FETCH DATA
  void fetchData() async {
    try {
      var data = await ApiService.getAllCities();

      setState(() {
        cityRiskData = data;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  // ✅ VERY IMPORTANT (YOU MISSED THIS)
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: Stack(
        children: [
          /// 🌍 GLOBE BACKGROUND
          Positioned.fill(
            child: GlobeWidget(
              filterType: filterType,
              apiData: cityRiskData,
              isLoading: isLoading,
            ),
          ),

          /// 🔝 HEADER TITLE
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "SeaSphere",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          /// 🧠 TITLE + DESCRIPTION
          Positioned(
            top: 120,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Track Water ",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: "Pollution",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B82F6),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Explore water pollution data across India's cities.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          /// 🎛 FILTER
          Positioned(
            top: 120,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                value: filterType,
                dropdownColor: const Color(0xFF1E293B),
                style: const TextStyle(color: Colors.white),
                underline: Container(),
                items: const [
                  DropdownMenuItem(value: 'all', child: Text("All")),
                  DropdownMenuItem(value: 'freshwater', child: Text("Freshwater")),
                  DropdownMenuItem(value: 'coastal', child: Text("Coastal")),
                ],
                onChanged: (value) {
                  setState(() {
                    filterType = value!;
                  });
                },
              ),
            ),
          ),

          /// 📊 LEGEND
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Legend", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 5),
                  Text("🟢 Low Pollution", style: TextStyle(color: Colors.green)),
                  Text("🟡 Moderate", style: TextStyle(color: Colors.yellow)),
                  Text("🔴 High", style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ),

          /// 📌 HEADER WIDGET (TOP)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(child: Header()),
          ),
        ],
      ),
    );
  }
}