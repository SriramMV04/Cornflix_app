import 'dart:async';
import 'package:apps/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 300),
          const Image(image: AssetImage('Images/cornflix_logo.png')),
          const SizedBox(height: 80),
          SpinKitRing(color: Colors.red.shade900),
          const SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Copyright',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Ubuntu-Bold',
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.copyright,
                color: Colors.grey,
                size: 15,
              ),
              SizedBox(width: 5),
              Text('Sriram M V',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Ubuntu-Bold',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
