// lib/splash_screen.dart
import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the LoginPage

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage()), // Navigate to Login Page
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'), // Replace with your logo
            SizedBox(height: 20),
            Text(
              'Home Service App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your trusted home services',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
