import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import '../../../Models/Anime/upcoming_anime_model.dart';
import '../../../Widgets/Anime/upcoming_anime.dart';

class UpcomingAnimeScreen extends StatefulWidget {
  const UpcomingAnimeScreen({super.key});

  @override
  State<UpcomingAnimeScreen> createState() => _UpcomingAnimeScreenState();
}

class _UpcomingAnimeScreenState extends State<UpcomingAnimeScreen> {
  late Future<List<UpcomingAnimeModel>> upcomingAnime;
  late final AsyncSnapshot snapshot;

  @override
  void initState() {
    super.initState();
    upcomingAnime = UpcomingAnimeModelApi().getUpcomingAnime();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: upcomingAnime,
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
          return UpcomingAnime(snapshot: snapshot);
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
