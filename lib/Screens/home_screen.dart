import 'dart:async';
import 'package:apps/Screens/Anime/anime_screen.dart';
import 'package:apps/Screens/Movies/movies_screen.dart';
import 'package:apps/Screens/TVseries/tv_series_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final List<Widget> _screens = [
    const MoviesScreen(),
    const TVseriesScreen(),
    const AnimeScreen(),
  ];

  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() {
                isAlertSet = true;
              },
            );
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: _screens[_index],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          ),
          child: GNav(
            gap: 8,
            haptic: true,
            backgroundColor: Colors.black,
            color: Colors.grey,
            activeColor: Colors.red.shade900,
            tabBackgroundColor: Colors.grey.shade900,
            textStyle: TextStyle(
              fontSize: 18,
              color: Colors.red.shade900,
              fontFamily: 'Ubuntu-Bold',
            ),
            padding: const EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.videocam_outlined,
                iconSize: 30,
                text: 'Movies',
              ),
              GButton(
                icon: Icons.live_tv_rounded,
                text: 'TV shows',
                iconSize: 25,
              ),
              GButton(
                icon: Icons.connected_tv,
                text: 'Anime',
                iconSize: 25,
              ),
            ],
            selectedIndex: _index,
            onTabChange: (index) {
              setState(() {
                _index = index;
              });
            },
          ),
        ),
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text("No Connection"),
      content: const Text("Please check your internet connectivity"),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, "Cancel");
            setState(() {
                isAlertSet = false;
              },
            );
            isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected) {
              showDialogBox();
              setState(() {
                isAlertSet = true;
              },
              );
            }
          },
          child: Text("Retry",
            style: TextStyle(
              color: Colors.red.shade900,
            ),
          ),
        ),
      ],
    ),
  );
}
