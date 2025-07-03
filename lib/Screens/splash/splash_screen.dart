import 'package:apppp/Screens/onboarding/onboarding_pageview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apppp/navBar/navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FirebaseAuth.instance.currentUser == null
              ? OnboardingPageview()
              : MainScreen(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image(
              image: AssetImage("assets/freepik--Plant--inject-63.jpg"),
            ),
          ),
          Spacer(),
          Image(image: AssetImage("assets/logo.jpg")),
          Spacer(),
          Image(image: AssetImage("assets/freepik--Circles--inject-5.jpg")),
        ],
      ),
    );
  }
}
