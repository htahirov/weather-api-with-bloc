import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../endpoints.dart';
import '../models/weather_response.dart';

class WeatherService {
  static Future<WeatherResponse> getWeatherInfo(String city) async {
    try {
      final endpoint = Endpoints.weatherUrl(city);
      final url = Uri.parse(endpoint);
      final response = await http.get(url);
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return WeatherResponse.fromJson(data);
      }
      throw Exception();
    } on SocketException catch (e) {
      throw SocketException('$e');
    } catch (e) {
      throw Exception();
    }
  }
}
