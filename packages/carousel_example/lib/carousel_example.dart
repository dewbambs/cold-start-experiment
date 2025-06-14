import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CarouselExamplePage extends StatefulWidget {
  const CarouselExamplePage({super.key});

  @override
  State<CarouselExamplePage> createState() => _CarouselExamplePageState();
}

class _CarouselExamplePageState extends State<CarouselExamplePage> {
  int _current = 0;
  final images = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carousel Example')),
      body: Column(
        children: [
          CarouselSlider(
            items: images
                .map((color) => Container(color: color, height: 200.0))
                .toList(),
            options: CarouselOptions(
              height: 200,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          LinearPercentIndicator(
            lineHeight: 8.0,
            percent: (_current + 1) / images.length,
          ),
        ],
      ),
    );
  }
}
