import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class City {
  final String id;
  final String name;
  final String state;
  final String type;
  final String waterType;
  final double lat;
  final double lng;
  final int pollutionIndex;
  final String pollutionLevel;
  final int population;

  City({
    required this.id,
    required this.name,
    required this.state,
    required this.type,
    required this.waterType,
    required this.lat,
    required this.lng,
    required this.pollutionIndex,
    required this.pollutionLevel,
    required this.population,
  });
}

/// 🎨 Pollution colors (MATCHING YOUR TS EXACTLY)
double getMarkerHue(String level) {
  switch (level) {
    case 'low':
      return BitmapDescriptor.hueGreen;
    case 'moderate':
      return BitmapDescriptor.hueYellow;
    case 'high':
      return BitmapDescriptor.hueOrange;
    case 'severe':
      return BitmapDescriptor.hueRed;
    default:
      return BitmapDescriptor.hueAzure;
  }
}

/// 🌍 ALL CITIES (COMBINED)
final List<City> allCities = [
  City(id: 'delhi', name: 'New Delhi', state: 'Delhi', type: 'capital', waterType: 'freshwater', lat: 28.6139, lng: 77.2090, pollutionIndex: 78, pollutionLevel: 'severe', population: 32941308),
  City(id: 'mumbai', name: 'Mumbai', state: 'Maharashtra', type: 'capital', waterType: 'coastal', lat: 19.0760, lng: 72.8777, pollutionIndex: 72, pollutionLevel: 'high', population: 20667656),
  City(id: 'kolkata', name: 'Kolkata', state: 'West Bengal', type: 'capital', waterType: 'freshwater', lat: 22.5726, lng: 88.3639, pollutionIndex: 68, pollutionLevel: 'high', population: 14850066),
  City(id: 'chennai', name: 'Chennai', state: 'Tamil Nadu', type: 'capital', waterType: 'coastal', lat: 13.0827, lng: 80.2707, pollutionIndex: 65, pollutionLevel: 'high', population: 11235018),
  City(id: 'bengaluru', name: 'Bengaluru', state: 'Karnataka', type: 'capital', waterType: 'freshwater', lat: 12.9716, lng: 77.5946, pollutionIndex: 58, pollutionLevel: 'moderate', population: 12765000),
  City(id: 'hyderabad', name: 'Hyderabad', state: 'Telangana', type: 'capital', waterType: 'freshwater', lat: 17.3850, lng: 78.4867, pollutionIndex: 62, pollutionLevel: 'high', population: 10534418),
  City(id: 'jaipur', name: 'Jaipur', state: 'Rajasthan', type: 'capital', waterType: 'freshwater', lat: 26.9124, lng: 75.7873, pollutionIndex: 48, pollutionLevel: 'moderate', population: 4107000),

  City(id: 'varanasi', name: 'Varanasi', state: 'Uttar Pradesh', type: 'tier2', waterType: 'freshwater', lat: 25.3176, lng: 82.9739, pollutionIndex: 82, pollutionLevel: 'severe', population: 1201815),
  City(id: 'kanpur', name: 'Kanpur', state: 'Uttar Pradesh', type: 'tier2', waterType: 'freshwater', lat: 26.4499, lng: 80.3319, pollutionIndex: 85, pollutionLevel: 'severe', population: 2920067),
  City(id: 'pune', name: 'Pune', state: 'Maharashtra', type: 'tier2', waterType: 'freshwater', lat: 18.5204, lng: 73.8567, pollutionIndex: 55, pollutionLevel: 'moderate', population: 6629347),
  City(id: 'surat', name: 'Surat', state: 'Gujarat', type: 'tier2', waterType: 'coastal', lat: 21.1702, lng: 72.8311, pollutionIndex: 62, pollutionLevel: 'high', population: 6564294),
  City(id: 'indore', name: 'Indore', state: 'Madhya Pradesh', type: 'tier2', waterType: 'freshwater', lat: 22.7196, lng: 75.8577, pollutionIndex: 42, pollutionLevel: 'moderate', population: 2167447),
];

Map<String, dynamic> getCityDetails(String cityId) {
  final city = allCities.firstWhere((c) => c.id == cityId);

  final base = city.pollutionIndex;

  return {
    "sources": [
      {"name": "Industrial Waste", "value": 35},
      {"name": "Domestic Sewage", "value": 25},
      {"name": "Agriculture", "value": 15},
      {"name": "Plastic Waste", "value": 15},
      {"name": "Other", "value": 10},
    ],
    "monthly": [
      {"month": "Jan", "value": base - 5},
      {"month": "Feb", "value": base - 3},
      {"month": "Mar", "value": base},
      {"month": "Apr", "value": base + 2},
      {"month": "May", "value": base + 5},
    ],
    "yearly": [
      {"year": "2020", "value": base - 10},
      {"year": "2021", "value": base - 5},
      {"year": "2022", "value": base},
      {"year": "2023", "value": base + 3},
      {"year": "2024", "value": base + 5},
    ],
    "images": [
      "https://images.unsplash.com/photo-1621451537084-482c73073a0f?w=800",
      "https://images.unsplash.com/photo-1530587191325-3db32d826c18?w=800",
    ],
    "references": [
      {"title": "CPCB Data", "url": "https://cpcb.nic.in"},
      {"title": "India Water Portal", "url": "https://indiawaterportal.org"},
    ]
  };
}