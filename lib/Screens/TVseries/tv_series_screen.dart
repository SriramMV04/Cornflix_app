import 'package:apps/Screens/TVseries/Ongoing/ongoing_tv_series_screen.dart';
import 'package:apps/Screens/TVseries/Popular/popular_tv_series_screen.dart';
import 'package:apps/Screens/TVseries/Top%20Rated/top_rated_tv_series_screen.dart';
import 'package:apps/Screens/side_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TVseriesScreen extends StatefulWidget {
  const TVseriesScreen({super.key});

  @override
  State<TVseriesScreen> createState() => _TVseriesScreenState();
}

class _TVseriesScreenState extends State<TVseriesScreen> {

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
              expandedHeight: 100,
              elevation: 0,
              bottom: TabBar(
                labelColor: Colors.red.shade900,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.red.shade900,
                indicatorWeight: 4,
                labelStyle: const TextStyle(
                  fontFamily: 'Ubuntu-Medium',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                tabs: const [
                  Tab(
                    text: 'Top rated',
                  ),
                  Tab(
                    text: 'Popular',
                  ),
                  Tab(
                    text: 'Ongoing',
                  ),
                ],
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              TopRatedTVseriesScreen(),
              PopularTVseriesScreen(),
              OngoingTVseriesScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
