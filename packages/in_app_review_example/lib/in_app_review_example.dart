import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

class InAppReviewExamplePage extends StatelessWidget {
  const InAppReviewExamplePage({super.key});

  Future<void> _review() async {
    final review = InAppReview.instance;
    if (await review.isAvailable()) {
      review.requestReview();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('In App Review Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: _review,
          child: const Text('Request Review'),
        ),
      ),
    );
  }
}
