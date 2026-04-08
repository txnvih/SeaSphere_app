import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/city_details.dart';
import 'screens/not_found.dart';

void main() {
  runApp(const SeaSphereApp());
}

class SeaSphereApp extends StatelessWidget {
  const SeaSphereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SeaSphere',

      initialRoute: '/',

      routes: {
        '/': (context) => const HomeScreen(),
      },

      onGenerateRoute: (settings) {
        // ✅ City details dynamic route
        if (settings.name != null &&
            settings.name!.startsWith('/city/')) {
          final cityId = settings.name!.split('/').last;

          return MaterialPageRoute(
            builder: (_) => CityDetailsScreen(cityId: cityId),
          );
        }

        // ✅ Not Found fallback
        return MaterialPageRoute(
          builder: (_) => const NotFoundScreen(),
        );
      },
    );
  }
}