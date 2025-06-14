import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridExamplePage extends StatelessWidget {
  const StaggeredGridExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staggered Grid Example')),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            height: 100.0 + (index % 3) * 40,
            color: Colors.primaries[index % Colors.primaries.length],
          );
        },
      ),
    );
  }
}
