import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import '../../../Models/Anime/top_rated_anime_model.dart';
import '../../../Widgets/Anime/top_rated_anime.dart';

class TopRatedAnimeScreen extends StatefulWidget {
  const TopRatedAnimeScreen({super.key});

  @override
  State<TopRatedAnimeScreen> createState() => _TopRatedAnimeScreenState();
}

class _TopRatedAnimeScreenState extends State<TopRatedAnimeScreen> {
  late Future<List<TopRatedAnimeModel>> topRatedAnime;
  late final AsyncSnapshot snapshot;

  @override
  void initState() {
    super.initState();
    topRatedAnime = TopRatedAnimeModelApi().getTopRatedAnime();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: topRatedAnime,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
              body: Container(
                color: Colors.grey.shade900,
                child: const Center(
                  child: Text(
                    'Something went wrong',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
          );
        } else if (snapshot.hasData) {
          return TopRatedAnime(snapshot: snapshot);
        } else {
          return Scaffold(
            backgroundColor: Colors.grey.shade900,
            body: GridView.builder(
                padding: const EdgeInsets.all(12),
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 280,
                ),
                itemBuilder: (context, index) {
                  return FadeShimmer(
                    width: 100,
                    height: 280,
                    highlightColor: Colors.black,
                    baseColor: Colors.grey[850],
                    millisecondsDelay: index * 300,
                    radius: 12,
                  );
                },
              ),
          );
        }
      },
    );
  }
}
