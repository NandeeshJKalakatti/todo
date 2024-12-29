import 'package:flutter/material.dart';
import 'package:todo/representation/screens/IntroScreen.dart';
import 'package:todo/representation/screens/Login_registration/register.dart';
import '../../static/app_styles.dart';
import '../widget/button_widget.dart';
import 'Login_registration/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const IntroScreen()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Welcome to UpTodo',
              style: AppStyle.headline,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                'Please login to your account or create new account to continue',
                style: AppStyle.subtitle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 450),
            squarelongbutton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
              text: 'LOGIN',
            ),
            const SizedBox(height: 16),
            OutlinedSquareButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => registerpage()),
                );
              }, // Implement create account navigation
              text: 'CREATE ACCOUNT',
            ),
          ],
        ),
      ),
    );
  }
}
