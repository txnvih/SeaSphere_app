import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> getAllCities() async {
  final res = await http
      .get(Uri.parse("http://10.0.2.2:8000/all-cities-risk"))
      .timeout(const Duration(seconds: 5)); 

  return jsonDecode(res.body);
}
}