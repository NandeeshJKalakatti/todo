import 'package:flutter/material.dart';
import 'IntroScreen.dart';
import '../../static/app_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const IntroScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png', // Replace with your image path
              height: 200,
            ),
            const SizedBox(height: 24),
            const Text(
              'UpTodo',
              style: AppStyle.splashText,
            ),
          ],
        ),
      ),
    );
  }
}
