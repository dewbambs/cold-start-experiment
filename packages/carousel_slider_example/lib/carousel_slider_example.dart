import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CarouselSliderExamplePage extends StatefulWidget {
  const CarouselSliderExamplePage({super.key});

  @override
  State<CarouselSliderExamplePage> createState() => _CarouselSliderExamplePageState();
}

class _CarouselSliderExamplePageState extends State<CarouselSliderExamplePage> {
  int _current = 0;
  final _items = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carousel Slider Example')),
      body: Column(
        children: [
          CarouselSlider(
            items: _items.map((e) => Container(
                      color: Colors.grey,
                      child: Center(child: Text('Item $e')),
                    )).toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LinearPercentIndicator(
              lineHeight: 8,
              percent: (_current + 1) / _items.length,
            ),
          )
        ],
      ),
    );
  }
}
