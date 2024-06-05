import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myshopneisha/landing_page.dart'; // Sesuaikan dengan lokasi file landing_page.dart

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Setelah waktu tertentu, navigasikan ke landing page
    Timer(
      Duration(seconds: 5), // Ganti dengan durasi yang diinginkan
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0), // Ganti warna latar belakang sesuai keinginan
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Image.asset(
              './lib/assets/logoca.png', // Ganti dengan path/logo sesuai dengan struktur proyek Anda
              width: 150,
              height: 150,
            ),
            
            
          ],
        ),
      ),
    );
  }
}
