import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_maker/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), navigateUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/social/AppLogo.png',
          height: 150,
          width: 150,
        ),
      ),
    );
  }

  void navigateUser() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }
}
