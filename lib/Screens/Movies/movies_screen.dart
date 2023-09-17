import 'package:apps/Screens/Movies/Popular/popular_movies_screen.dart';
import 'package:apps/Screens/Movies/Top%20Rated/top_rated_movies_screen.dart';
import 'package:apps/Screens/Movies/Upcoming/upcoming_movies_screen.dart';
import 'package:flutter/material.dart';
import '../side_bar_screen.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const SideBarScreen(),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              floating: true,
              title: Image.asset('Images/cornflix_logo.png', width: 170),
              centerTitle: true,
              expandedHeight: 100,
              elevation: 0,
              bottom: TabBar(
                labelColor: Colors.red.shade900,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.red.shade900,
                indicatorWeight: 4,
                labelStyle: const TextStyle(
                  fontFamily: 'Ubuntu-Medium',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                tabs: const [
                  Tab(
                    text: 'Top rated',
                  ),
                  Tab(
                    text: 'Popular',
                  ),
                  Tab(
                    text: 'Upcoming',
                  ),
                ],
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              TopRatedMoviesScreen(),
              PopularMoviesScreen(),
              UpcomingMoviesScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
