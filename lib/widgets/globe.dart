import 'package:flutter/material.dart';
import '../data/AllCities.dart';

class GlobeWidget extends StatelessWidget {
  final String filterType;
  final List<dynamic> apiData;
  final bool isLoading;

  const GlobeWidget({
    super.key,
    required this.filterType,
    required this.apiData,
    required this.isLoading,
  });

  // 🎨 Risk color (ML based)
  Color getRiskColor(double risk) {
    if (risk < 0.3) return Colors.green;
    if (risk < 0.6) return Colors.yellow;
    if (risk < 0.8) return Colors.orange;
    return Colors.red;
  }

  // 📍 Convert lat/lng → screen position (IMPROVED mapping)
  Offset mapToScreen(double lat, double lng, Size size) {
    double x = (lng + 180) * (size.width / 360);
    double y = (90 - lat) * (size.height / 180);
    return Offset(x, y);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = constraints.biggest;

        return Stack(
          children: [
            /// 🌍 Background Globe Feel
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [Color(0xFF0B0F1A), Color(0xFF020617)],
                  center: Alignment.center,
                  radius: 1.2,
                ),
              ),
            ),

            /// 📍 MARKERS
            ...allCities.map((city) {
              // 🔍 Apply filter
              if (filterType != 'all' &&
                  city.waterType != filterType) {
                return const SizedBox();
              }

              // 🔗 Match backend data
              var backendCity = apiData.firstWhere(
                (c) => c["city"] == city.name,
                orElse: () => null,
              );

              double risk =
                  backendCity != null ? backendCity["risk"] : 0.0;

              // 📍 Position
              Offset pos = mapToScreen(city.lat, city.lng, size);

              return Positioned(
                left: pos.dx - 10,
                top: pos.dy - 20,
                child: Column(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: getRiskColor(risk),
                      size: 22,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        city.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        );
      },
    );
  }
}