import 'dart:convert';
import '../../keys.dart';
import 'package:http/http.dart' as http;

class TopRatedAnimeModel {
  String? posterImagePath;
  String? backgroundImagePath;
  String? trailerUrl;
  String? title;
  int? episodes;
  String? status;
  String? airedFrom;
  String? duration;
  double? ratings;
  String? description;
  int? year;
  String? type;
  int? rank;
  int? voteCount;

  TopRatedAnimeModel({
    required this.posterImagePath,
    required this.backgroundImagePath,
    required this.trailerUrl,
    required this.title,
    required this.episodes,
    required this.status,
    required this.airedFrom,
    required this.duration,
    required this.ratings,
    required this.description,
    required this.year,
    required this.type,
    required this.rank,
    required this.voteCount,
  });

  factory TopRatedAnimeModel.fromJson(Map<String, dynamic> json) {
    return TopRatedAnimeModel(
      posterImagePath: json['images']['jpg']['image_url'] ?? '/7dFZJ2ZJJdcmkp05B9NWlqTJ5tq.jpg',
      backgroundImagePath: json['images']['jpg']['large_image_url'] ?? '/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg',
      trailerUrl: json['trailer']['url'] ?? '-',
      title: json['title'] ?? '-',
      episodes: json['episodes'] ?? 0,
      status: json['status'] ?? '-',
      airedFrom: json['aired']['string'] ?? '-',
      duration: json['duration'] ?? '-',
      ratings: json['score'] ?? 0.0,
      description: json['synopsis'] ?? 'Description not available',
      year: json['year'] ?? 0000,
      type: json['rating'] ?? '-',
      rank: json['rank'] ?? 0,
      voteCount: json['scored_by'] ?? 0,
    );
  }
}

class TopRatedAnimeModelApi {
  Future<List<TopRatedAnimeModel>> getTopRatedAnime() async {
    const url = ConstantKeys.topRatedAnimeUrl;

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List;
      return data.map((topRatedAnime) =>
          TopRatedAnimeModel.fromJson(topRatedAnime)).toList();
    } else {
      throw Exception('Something went wrong....');
    }
  }
}