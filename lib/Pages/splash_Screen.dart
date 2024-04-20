import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newnew/Pages/Login/singUp.dart';
import 'package:newnew/Pages/homepage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});
// this is my splash page which I referred from a online video with the help of external SDK packages
// like lotti and animated_splash_screen.dart

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100), // Adjust the bottom padding as needed
              child: Lottie.asset("assets/Animation/Animation - 1713527392045.json"),
            ),
          ),
        ],
      ),
      nextScreen: const Homepage(),
      splashIconSize: 550,
      backgroundColor: Colors.blueGrey[600]!,
    );
  }
}
