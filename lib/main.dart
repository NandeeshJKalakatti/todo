import 'package:flutter/material.dart';
import 'package:todo/representation/screens/splash_screeen.dart';
import 'representation/screens/IntroScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
