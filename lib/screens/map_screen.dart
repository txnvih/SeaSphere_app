import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../services/api_service.dart';
import '../data/AllCities.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  Set<Marker> markers = {};
  Set<Circle> circles = {}; // 🔥 HEATMAP ALTERNATIVE

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // 🎨 Risk color
  Color getRiskColor(double risk) {
    if (risk < 0.3) return Colors.green;
    if (risk < 0.6) return Colors.yellow;
    if (risk < 0.8) return Colors.orange;
    return Colors.red;
  }

  void loadData() async {
    try {
      var apiData = await ApiService.getAllCities();

      Set<Marker> tempMarkers = {};
      Set<Circle> tempCircles = {};

      for (var city in allCities) {
        var backendCity = apiData.firstWhere(
          (c) => c["city"] == city.name,
          orElse: () => null,
        );

        double risk =
            backendCity != null ? backendCity["risk"] : 0.0;

        Color color = getRiskColor(risk);

        // 🔴 MARKER
        tempMarkers.add(
          Marker(
            markerId: MarkerId(city.id),
            position: LatLng(city.lat, city.lng),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              getMarkerHue(city.pollutionLevel),
            ),
            infoWindow: InfoWindow(
              title: city.name,
              snippet: "Risk: ${risk.toStringAsFixed(2)}",
            ),
          ),
        );

        // 🌡️ FAKE HEATMAP (CIRCLE)
        tempCircles.add(
          Circle(
            circleId: CircleId(city.id),
            center: LatLng(city.lat, city.lng),
            radius: 50000 + (risk * 50000), // dynamic spread
            fillColor: color.withOpacity(0.4),
            strokeColor: color,
            strokeWidth: 1,
          ),
        );
      }

      setState(() {
        markers = tempMarkers;
        circles = tempCircles;
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFF0B0F1A),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Center(
        child: Text(
          "APP WORKING",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}