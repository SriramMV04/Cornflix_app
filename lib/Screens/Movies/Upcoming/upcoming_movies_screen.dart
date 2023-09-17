import 'package:apps/Widgets/Movies/upcoming_movies.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import '../../../Models/Movies/upcoming_movies_model.dart';

class UpcomingMoviesScreen extends StatefulWidget {
  const UpcomingMoviesScreen({super.key});

  @override
  State<UpcomingMoviesScreen> createState() => _UpcomingMoviesScreenState();
}

class _UpcomingMoviesScreenState extends State<UpcomingMoviesScreen> {
  late Future<List<UpcomingMoviesModel>> upcomingMovies;
  late final AsyncSnapshot snapshot;

  @override
  void initState() {
    super.initState();
    upcomingMovies = UpcomingMoviesModelApi().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: upcomingMovies,
      builder: (context, snapshot) {
        if(snapshot.hasError) {
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
        } else if(snapshot.hasData) {
          return UpcomingMovies(snapshot: snapshot);
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
      }
    );
  }
}
