class Weather {
  final String cityName;
  final String country;
  final String place_id;
  Weather({
    required this.cityName,
    required this.country,
    required this.place_id,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['predictions'][0]['structured_formatting']['main_text'] ??
          'Unknown city name',
      country: json['predictions'][0]['structured_formatting']
              ['secondary_text'] ??
          'Unknown Country',
      place_id: json['predictions'][0]['place_id'] ?? 'Unknown Place ID',
    );
  }

  @override
  String toString() => ''' 
    City: $cityName 
    Country: $country 
    Place id: $place_id 
    ''';
}
