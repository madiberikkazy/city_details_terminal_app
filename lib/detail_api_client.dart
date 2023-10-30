import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_console_app/config2.dart';
import 'package:weather_console_app/detail.dart';

class DetailApiClient {
  Future<Detail> searchCities(String place_id) async {
    final url =
        '${Config2().baseUrl}$place_id${Config2().currentUrl}${Config2().apiKey}';
    print('Detail website is:  $url \n\n');

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      print('Request failed with status: ${response.statusCode}');
      throw DetailApiException(
          'Error searching for details with place_id $place_id');
    }

    final Map<String, dynamic> jsonResponse =
        Map.castFrom(jsonDecode(response.body));

    if (!jsonResponse.containsKey('result')) {
      throw DetailApiException('No details found for place_id $place_id');
    }

    // Extract the necessary data for creating Detail objects.
    final String website =
        jsonResponse['result']['website'] ?? 'Unknown website';
    final double rating = jsonResponse['result']['rating'] ?? 0.0;
    final String global_code =
        jsonResponse['result']['plus_code'] ?? 'Unknown code';

    // Create a list of Detail objects with the extracted data.
    final Detail details = Detail(website: website, rating: rating);

    return details;
  }
}

class DetailApiException implements Exception {
  final String message;

  const DetailApiException(this.message);
}
