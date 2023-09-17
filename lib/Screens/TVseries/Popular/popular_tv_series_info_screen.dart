import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Models/TVseries/popular_tv_series_model.dart';
import '../../../keys.dart';

class PopularTVseriesInfoScreen extends StatelessWidget {
  const PopularTVseriesInfoScreen({super.key, required this.popularTVshow});
  final PopularTVseriesModel popularTVshow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.shade900,
            elevation: 0,
            leading: Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.only(top: 15, left: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(CupertinoIcons.back),
              ),
            ),
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                child: Image.network(
                  '${ConstantKeys.imageUrl}${popularTVshow.posterImagePath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(popularTVshow.title.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.grey.shade800,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          height: 100,
                          width: (MediaQuery.of(context).size.width - 40) / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(popularTVshow.popularity.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text('Popularity',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu-Medium',
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                      ),
                      SizedBox(
                        height: 100,
                        width: (MediaQuery.of(context).size.width - 40) / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: popularTVshow.ratings.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.orangeAccent,
                                ),
                                children: const [
                                  TextSpan(
                                    text: ' / 10',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text('Rating',
                              style: TextStyle(
                                fontFamily: 'Ubuntu-Medium',
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 100,
                          width: (MediaQuery.of(context).size.width - 40) / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(popularTVshow.voteCount.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text('Vote Count',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu-Medium',
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.grey.shade800,
                  ),
                  const SizedBox(height: 10),
                  const Text('Description',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu-Medium',
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(popularTVshow.description.toString(),
                    style: const TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.grey.shade800,
                  ),
                  const SizedBox(height: 10),
                  const Text('More Details',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu-Medium',
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Released On',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(popularTVshow.releaseDate.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Original Title',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(popularTVshow.originalTitle.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Original Language',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(popularTVshow.originalLang.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Rating',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(popularTVshow.ratings.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Vote Count',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(popularTVshow.voteCount.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Popularity',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(popularTVshow.popularity.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
