class Config {
  Config._internal();

  static final Config _instance = Config._internal();

  factory Config() => _instance;

  String apiKey = 'AIzaSyDSc3bK2uacejfepEMiJlrVw9DFC8WVonI';
  String baseUrl =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=';
  String currentUrl = '&language=en&types=%28cities%29&key=';
}
