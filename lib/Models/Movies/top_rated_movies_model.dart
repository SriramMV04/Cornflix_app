import 'dart:convert';
import 'package:apps/keys.dart';
import 'package:http/http.dart' as http;

class TopRatedMoviesModel {
  String? backgroundImagePath;
  String? originalLang;
  String? originalTitle;
  String? description;
  double? popularity;
  String? posterImagePath;
  String? releaseDate;
  String? title;
  double? rating;
  int? voteCount;

  TopRatedMoviesModel({
    required this.backgroundImagePath,
    required this.originalTitle,
    required this.originalLang,
    required this.description,
    required this.popularity,
    required this.posterImagePath,
    required this.releaseDate,
    required this.title,
    required this.rating,
    required this.voteCount,
  });

  factory TopRatedMoviesModel.fromJson(Map<String, dynamic> json) {
    return TopRatedMoviesModel(
      backgroundImagePath: json['backdrop_path'] ?? '/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg',
      originalTitle: json['original_title'] ?? '-',
      originalLang: json['original_language'] ?? '-',
      description: json['overview'] ?? 'Description not available',
      popularity: json['popularity'].toDouble() ?? 0.0,
      posterImagePath: json['poster_path'] ?? '/7dFZJ2ZJJdcmkp05B9NWlqTJ5tq.jpg',
      releaseDate: json['release_date'] ?? '-',
      title: json['title'] ?? '-',
      rating: json['vote_average'].toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}

class TopRatedMoviesModelApi {
  Future<List<TopRatedMoviesModel>> getTopRatedMovies() async {
    const url = '${ConstantKeys.topRatedMoviesUrl}api_key=${ConstantKeys.apiKey}';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'] as List;
      return data.map((topMovie) => TopRatedMoviesModel.fromJson(topMovie)).toList();
    } else {
      throw Exception('Something went wrong....');
    }
  }
}
