import 'package:flutter/material.dart';

import '../../Screens/Anime/Upcoming/upcoming_anime_info_screen.dart';

class UpcomingAnime extends StatelessWidget {
  const UpcomingAnime({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 280,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UpcomingAnimeInfoScreen(upcomingAnime: snapshot.data![index])));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.black,
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${snapshot.data![index].posterImagePath}',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
