import 'package:flutter/material.dart';
import 'package:todo/representation/screens/wellcomescreen.dart';
import '../widget/button_widget.dart';
import '../../static/app_styles.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'images/Frame_161.png',
      'bottom_image': 'images/NAV1.png',
      'title': 'Manage your tasks',
      'subtitle': 'You can easily manage all of your daily tasks in DoMe for free.',
    },
    {
      'image': 'images/Frame_162.png',
      'bottom_image': 'images/NAV2.png',
      'title': 'Create daily routine',
      'subtitle': 'In Uptodo  you can create your personalized routine to stay productive',
    },
    {
      'image': 'images/Group_182.png',
      'bottom_image': 'images/NAV3.png',
      'title': 'Orgonaize your tasks',
      'subtitle': 'You can organize your daily tasks by adding your tasks into separate categories',
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: const Text(
            'Skip',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const WelcomeScreen()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                final page = _pages[index];
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        page['image']!,
                        height: 300,
                      ),
                      Image.asset(
                        page['bottom_image']!,
                        height: 100,
                        width: 80,
                      ),
                      Text(
                        page['title']!,
                        style: AppStyle.headline,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          page['subtitle']!,
                          style: AppStyle.subtitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 90),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  TextButton(
                    onPressed: () => _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                    child: const Text(
                      'BACK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
                _currentPage == _pages.length - 1
                    ? CustomSquareButton2(
                        onPressed: _nextPage,
                        text: 'GET STARTED',
                      )
                    : CustomSquareButton(
                        onPressed: _nextPage,
                        text: 'Next',
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
