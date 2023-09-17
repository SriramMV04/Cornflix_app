import 'dart:convert';
import 'package:apps/keys.dart';
import 'package:http/http.dart' as http;

class UpcomingMoviesModel {
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

  UpcomingMoviesModel({
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

  factory UpcomingMoviesModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMoviesModel(
      backgroundImagePath: json['backdrop_path'] ?? '',
      originalLang: json['original_language'] ?? '-',
      originalTitle: json['original_title'] ?? '-',
      description: json['overview'] ?? 'Description not available',
      popularity: json['popularity'].toDouble() ?? 0.0,
      posterImagePath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '-',
      title: json['title'] ?? '-',
      ratings: json['vote_average'].toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}

class UpcomingMoviesModelApi {
  Future<List<UpcomingMoviesModel>> getUpcomingMovies() async {
    const url = '${ConstantKeys.upcomingMoviesUrl}api_key=${ConstantKeys.apiKey}';

    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return data.map((upcomingMovie) => UpcomingMoviesModel.fromJson(upcomingMovie)).toList();
    } else {
      throw Exception('Something went wrong....');
    }
  }
}