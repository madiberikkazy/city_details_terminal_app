class Detail {
  final String website;
  final double rating;

  Detail({
    required this.website,
    required this.rating,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      website: json['result']['website'] ?? 'Unknown website',
      rating: json['result']['rating'] ?? 'Unknown rating',
    );
  }

  @override
  String toString() => ''' 
    Website: $website 
    Rating: $rating 
    ''';
}
