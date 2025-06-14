import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotsIndicatorExamplePage extends StatefulWidget {
  const DotsIndicatorExamplePage({super.key});

  @override
  State<DotsIndicatorExamplePage> createState() => _DotsIndicatorExamplePageState();
}

class _DotsIndicatorExamplePageState extends State<DotsIndicatorExamplePage> {
  final PageController _controller = PageController();
  double _position = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _position = _controller.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dots Indicator Example')),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: const [
                ColoredBox(color: Colors.amber),
                ColoredBox(color: Colors.teal),
                ColoredBox(color: Colors.indigo),
              ],
            ),
          ),
          DotsIndicator(dotsCount: 3, position: _position),
        ],
      ),
    );
  }
}
