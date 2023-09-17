import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import '../../../Models/TVseries/ongoing_tv_series_model.dart';
import '../../../Widgets/TVseries/ongoing_tv_series.dart';

class OngoingTVseriesScreen extends StatefulWidget {
  const OngoingTVseriesScreen({super.key});

  @override
  State<OngoingTVseriesScreen> createState() => _OngoingTVseriesScreenState();
}

class _OngoingTVseriesScreenState extends State<OngoingTVseriesScreen> {
  late Future<List<OngoingTVseriesModel>> ongoingTVseries;
  late final AsyncSnapshot snapshot;

  @override
  void initState() {
    super.initState();
    ongoingTVseries = OngoingTVseriesModelApi().getOngoingTVseries();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ongoingTVseries,
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
          return OngoingTVseries(snapshot: snapshot);
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
