import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FlutterStaggeredGridViewExamplePage extends StatelessWidget {
  const FlutterStaggeredGridViewExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staggered Grid Example')),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          height: (index % 3 + 1) * 50,
          color: Colors.teal[100 * ((index % 8) + 1)],
        ),
      ),
    );
  }
}
