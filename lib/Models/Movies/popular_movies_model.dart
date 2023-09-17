import 'dart:convert';
import 'package:apps/keys.dart';
import 'package:http/http.dart' as http;

class PopularMoviesModel {
  String? backgroundImagePath;
  String? originalLang;
  String? originalTitle;
  String? description;
  double? popularity;
  String? posterImagePath;
  String? releaseDate;
  String? title;
  double? ratings;
  int? voteCount;

  PopularMoviesModel({
    required this.backgroundImagePath,
    required this.originalLang,
    required this.originalTitle,
    required this.description,
    required this.popularity,
    required this.posterImagePath,
    required this.releaseDate,
    required this.title,
    required this.ratings,
    required this.voteCount,
  });

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) {
    return PopularMoviesModel(
      backgroundImagePath: json['backdrop_path'] ?? '/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg',
      originalLang: json['original_language'] ?? '-',
      originalTitle: json['original_title'] ?? '-',
      description: json['overview'] ?? 'Description not available',
      popularity: json['popularity'].toDouble() ?? 0.0,
      posterImagePath: json['poster_path'] ?? '/7dFZJ2ZJJdcmkp05B9NWlqTJ5tq.jpg',
      releaseDate: json['release_date'] ?? '-',
      title: json['title'] ?? '-',
      ratings: json['vote_average'].toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}

class PopularMoviesModelApi {
  Future<List<PopularMoviesModel>> getPopularMovies() async {
    const url = '${ConstantKeys.popularMoviesUrl}api_key=${ConstantKeys.apiKey}';

    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return data.map((popularMovie) => PopularMoviesModel.fromJson(popularMovie)).toList();
    } else {
      throw Exception('Something went wrong....');
    }
  }
}