import 'package:apps/keys.dart';
import 'package:flutter/material.dart';
import '../../Screens/Movies/Popular/popular_movies_info_screen.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key, required this.snapshot});
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => PopularMoviesInfoScreen(popularMovie: snapshot.data![index])));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.black,
                  child: SizedBox(
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${ConstantKeys.imageUrl}${snapshot.data![index]
                            .posterImagePath}'),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
