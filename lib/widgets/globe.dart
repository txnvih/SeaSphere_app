import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../data/cities.dart';

class GlobeWidget extends StatefulWidget {
  final String filterType;

  const GlobeWidget({super.key, required this.filterType});

  @override
  State<GlobeWidget> createState() => _GlobeWidgetState();
}

class _GlobeWidgetState extends State<GlobeWidget> {

  GoogleMapController? mapController;

  final LatLng indiaCenter = const LatLng(20.5937, 78.9629);



  /// 🎨 Pollution color logic (like your TS)
  double getMarkerHue(String level) {
    switch (level) {
      case "high":
        return BitmapDescriptor.hueRed;
      case "moderate":
        return BitmapDescriptor.hueYellow;
      case "low":
        return BitmapDescriptor.hueGreen;
      default:
        return BitmapDescriptor.hueAzure;
    }
  }

  Set<Marker> getMarkers() {
  return allCities
      .where((city) {
        if (widget.filterType == 'all') return true;
        if (widget.filterType == 'freshwater') {
          return city.waterType == 'freshwater' || city.waterType == 'both';
        }
        if (widget.filterType == 'coastal') {
          return city.waterType == 'coastal' || city.waterType == 'both';
        }
        return true;
      })
      .map((city) {
        return Marker(
          markerId: MarkerId(city.id),
          position: LatLng(city.lat, city.lng),

          icon: BitmapDescriptor.defaultMarkerWithHue(
            getMarkerHue(city.pollutionLevel),
          ),

          infoWindow: InfoWindow(
            title: city.name,
            snippet:
                "${city.state} • ${city.pollutionLevel} pollution • Index ${city.pollutionIndex}",

            onTap: () {
              Navigator.pushNamed(context, "/city/${city.id}");
            },
          ),
        );
      })
      .toSet();
}

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: indiaCenter,
        zoom: 4.5,
      ),
      markers: getMarkers(),
      onMapCreated: (controller) {
        mapController = controller;
      },
    );
  }
}