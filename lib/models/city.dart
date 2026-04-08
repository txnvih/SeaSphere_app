class City {
  final String id;
  final String name;
  final String state;
  final double lat;
  final double lng;
  final String pollutionLevel;
  final int pollutionIndex;
  final String type;

  City({
    required this.id,
    required this.name,
    required this.state,
    required this.lat,
    required this.lng,
    required this.pollutionLevel,
    required this.pollutionIndex,
    required this.type,
  });
}