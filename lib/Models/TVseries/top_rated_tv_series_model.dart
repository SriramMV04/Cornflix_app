import 'dart:convert';
import 'package:apps/keys.dart';
import 'package:http/http.dart' as http;

class TopRatedTVseriesModel {
  String? backgroundImagePath;
  String? releaseDate;
  String? title;
  String? description;
  String? posterImagePath;
  double? ratings;
  String? originalLang;
  String? originalTitle;
  double? popularity;
  int? voteCount;

  TopRatedTVseriesModel({
    required this.backgroundImagePath,
    required this.releaseDate,
    required this.title,
    required this.description,
    required this.posterImagePath,
    required this.ratings,
    required this.originalTitle,
    required this.originalLang,
    required this.popularity,
    required this.voteCount,
  });

  factory TopRatedTVseriesModel.fromJson(Map<String, dynamic> json) {
    return TopRatedTVseriesModel(
      backgroundImagePath: json['backdrop_path'] ?? '/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg',
      releaseDate: json['first_air_date'] ?? '-',
      title: json['name'] ?? '-',
      description: json['overview'] ?? 'Description not available',
      posterImagePath: json['poster_path'] ?? '/7dFZJ2ZJJdcmkp05B9NWlqTJ5tq.jpg',
      ratings: json['vote_average'].toDouble() ?? 0.0,
      originalTitle: json['original_name'] ?? '-',
      originalLang: json['original_language'] ?? '-',
      popularity: json['popularity'].toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}

class TopRatedTVseriesModelApi {
  Future<List<TopRatedTVseriesModel>> getTopRatedTVseries() async {
    const url = '${ConstantKeys.topRatedTVseriesUrl}api_key=${ConstantKeys.apiKey}';

    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return data.map((topTVseries) => TopRatedTVseriesModel.fromJson(topTVseries)).toList();
    } else {
      throw Exception('Something went wrong....');
    }
  }
}