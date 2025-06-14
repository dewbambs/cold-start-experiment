import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotsIndicatorExamplePage extends StatefulWidget {
  const DotsIndicatorExamplePage({super.key});

  @override
  State<DotsIndicatorExamplePage> createState() => _DotsIndicatorExamplePageState();
}

class _DotsIndicatorExamplePageState extends State<DotsIndicatorExamplePage> {
  final _pageController = PageController();
  double _position = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _position = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dots Indicator Example')),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView(
              controller: _pageController,
              children: const [
                Center(child: Text('Page 1')),
                Center(child: Text('Page 2')),
                Center(child: Text('Page 3')),
              ],
            ),
          ),
          DotsIndicator(dotsCount: 3, position: _position),
        ],
      ),
    );
  }
}
