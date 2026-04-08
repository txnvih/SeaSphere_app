import 'package:flutter/material.dart';

class CityDetailsScreen extends StatelessWidget {
  final String cityId;

  const CityDetailsScreen({super.key, required this.cityId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("City: $cityId")),
      body: Center(
        child: Text("Details for city: $cityId"),
      ),
    );
  }
}