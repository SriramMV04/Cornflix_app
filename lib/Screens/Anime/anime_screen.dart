import 'package:apps/Screens/Anime/Ongoing/ongoing_anime_screen.dart';
import 'package:apps/Screens/Anime/Top%20Rated/top_rated_anime_screen.dart';
import 'package:apps/Screens/Anime/Upcoming/upcoming_anime_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../side_bar_screen.dart';

class AnimeScreen extends StatefulWidget {
  const AnimeScreen({super.key});

  @override
  State<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen> {

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
              floating: true,
              pinned: true,
              title: Image.asset('Images/cornflix_logo.png', width: 170),
              centerTitle: true,
              elevation: 0,
              expandedHeight: 100,
              bottom: TabBar(
                labelColor: Colors.red.shade900,
                indicatorColor: Colors.red.shade900,
                indicatorWeight: 4,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Ubuntu-Medium',
                  fontWeight: FontWeight.bold,
                ),
                tabs: const [
                  Tab(
                    text: 'Top rated',
                  ),
                  Tab(
                    text: 'Ongoing',
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
              TopRatedAnimeScreen(),
              OngoingAnimeScreen(),
              UpcomingAnimeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
