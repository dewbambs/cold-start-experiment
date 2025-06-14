import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class IntlLoggerExamplePage extends StatelessWidget {
  IntlLoggerExamplePage({super.key});

  final _logger = Logger();
  final _formatter = DateFormat.yMd().add_jms();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatted = _formatter.format(now);
    _logger.i('Formatted date: $formatted');
    return Scaffold(
      appBar: AppBar(title: const Text('Intl & Logger Example')),
      body: Center(child: Text(formatted)),
    );
  }
}
