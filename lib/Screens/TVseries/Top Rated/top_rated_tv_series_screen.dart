import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import '../../../Models/TVseries/top_rated_tv_series_model.dart';
import '../../../Widgets/TVseries/top_rated_tv_series.dart';

class TopRatedTVseriesScreen extends StatefulWidget {
  const TopRatedTVseriesScreen({super.key});

  @override
  State<TopRatedTVseriesScreen> createState() => _TopRatedTVseriesScreenState();
}

class _TopRatedTVseriesScreenState extends State<TopRatedTVseriesScreen> {
  late Future<List<TopRatedTVseriesModel>> topRatedTVseries;
  late final AsyncSnapshot snapshot;

  @override
  void initState() {
    super.initState();
    topRatedTVseries = TopRatedTVseriesModelApi().getTopRatedTVseries();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: topRatedTVseries,
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

                // child: Center(
                //   child: Text(
                //     snapshot.error.toString(),
                //     style: const TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),
                // ),

              )
          );
        } else if (snapshot.hasData) {
          return TopRatedTVseries(snapshot: snapshot);
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
