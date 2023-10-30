class Config2 {
  Config2._internal();

  static final Config2 _instance = Config2._internal();

  factory Config2() => _instance;

  String apiKey = 'AIzaSyDSc3bK2uacejfepEMiJlrVw9DFC8WVonI';
  String baseUrl =
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=';
  String currentUrl = '&key=';
}
