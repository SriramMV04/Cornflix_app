import 'package:apps/Screens/home_screen.dart';
import 'package:apps/google_sign_in_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../home_page.dart';

class SideBarScreen extends StatelessWidget {
  const SideBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                user.displayName!,
                  style: const TextStyle(
                    fontFamily: 'Ubuntu-Bold',
                    fontSize: 16,
                    color: Colors.white,
                  ),
              ),
              accountEmail: Text(
                user.email!,
                style: const TextStyle(
                  fontFamily: 'Ubuntu-Bold',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
                child: ClipOval(
                  child: Image.asset(
                    user.photoURL!,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
                leading: Icon(CupertinoIcons.home,
                  color: Colors.red.shade900,
                ),
                title: const Text('Home',
                  style: TextStyle(
                    fontFamily: 'Ubuntu-Bold',
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()))
            ),
            ListTile(
              leading: Icon(Icons.share,
                color: Colors.red.shade900,
              ),
              title: const Text('Share',
                style: TextStyle(
                  fontFamily: 'Ubuntu-Bold',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                //add link to share app
              },
            ),
            ListTile(
              leading: Icon(Icons.mail_outline,
                color: Colors.red.shade900,
              ),
              title: const Text('Feedback',
                style: TextStyle(
                  fontFamily: 'Ubuntu-Bold',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              onTap: () => launchUrl(
                Uri.parse('mailto:srirammv04@gmail.com'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star_border,
                color: Colors.red.shade900,
              ),
              title: const Text('Rate Us',
                style: TextStyle(
                  fontFamily: 'Ubuntu-Bold',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                //add link to rate app
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.shield_lefthalf_fill,
                color: Colors.red.shade900,
              ),
              title: const Text('Privacy Policy',
                style: TextStyle(
                  fontFamily: 'Ubuntu-Bold',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              onTap: () => launchUrl(
                Uri.parse('https://doc-hosting.flycricket.io/cornflix-privacy-policy/62b2d75b-55a4-4915-ba09-2d8ad433505f/privacy'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.note_add_outlined,
                color: Colors.red.shade900,
              ),
              title: const Text('Terms and Conditions',
                style: TextStyle(
                  fontFamily: 'Ubuntu-Bold',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              onTap: () => launchUrl(
                Uri.parse('https://doc-hosting.flycricket.io/cornflix-terms-of-use/adb2166c-92f9-4207-bd3b-b8bbdb139d6a/terms'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined,
                color: Colors.red.shade900,
              ),
              title: const Text('Logout',
                style: TextStyle(
                  fontFamily: 'Ubuntu-Bold',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
