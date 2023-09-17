import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import '../../../Models/Anime/ongoing_anime_model.dart';
import '../../../Widgets/Anime/ongoing_anime.dart';

class OngoingAnimeScreen extends StatefulWidget {
  const OngoingAnimeScreen({super.key});

  @override
  State<OngoingAnimeScreen> createState() => _OngoingAnimeScreenState();
}

class _OngoingAnimeScreenState extends State<OngoingAnimeScreen> {
  late Future<List<OngoingAnimeModel>> ongoingAnime;
  late final AsyncSnapshot snapshot;

  @override
  void initState() {
    super.initState();
    ongoingAnime = OngoingAnimeModelApi().getOngoingAnime();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ongoingAnime,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
              body: Container(
                color: Colors.grey.shade900,
                child: const Center(
                  child: Text(
                    'Something went wrong',
                     //snapshot.error.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
          );
        } else if (snapshot.hasData) {
          return OngoingAnime(snapshot: snapshot);
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
