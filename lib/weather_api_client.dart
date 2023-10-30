import 'package:weather_console_app/config.dart';
import 'dart:convert';
import 'package:weather_console_app/weather.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class WeatherApiClient {
  Future<List<Weather>> searchCities(String cityName) async {
    final url =
        '${Config().baseUrl}$cityName${Config().currentUrl}${Config().apiKey}';
    print(url);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      print('Request failed with status: ${response.statusCode}');
      throw WeatherApiException(
          'Error searching for cities with name $cityName');
    }

    final Map<String, dynamic> jsonResponse =
        Map.castFrom(jsonDecode(response.body));

    if (!jsonResponse.containsKey('predictions')) {
      throw WeatherApiException('No predictions found for $cityName');
    }

    List<Weather> cities = [];

    for (var prediction in jsonResponse['predictions']) {
      String cityName = prediction['structured_formatting']['main_text'] ??
          'Unknown city name';
      String countryName = prediction['structured_formatting']
              ['secondary_text'] ??
          'Unknown Country';
      String place_id = prediction['place_id'] ?? 'Unknown Place ID';
      Weather city =
          Weather(cityName: cityName, country: countryName, place_id: place_id);
      cities.add(city);
    }

    return cities;
  }
}

class WeatherApiException implements Exception {
  final String message;

  const WeatherApiException(this.message);
}
