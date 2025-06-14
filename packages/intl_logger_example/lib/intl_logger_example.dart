import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class IntlLoggerExamplePage extends StatefulWidget {
  const IntlLoggerExamplePage({super.key});

  @override
  State<IntlLoggerExamplePage> createState() => _IntlLoggerExamplePageState();
}

class _IntlLoggerExamplePageState extends State<IntlLoggerExamplePage> {
  final _logger = Logger();
  late String _formatted;

  @override
  void initState() {
    super.initState();
    _formatted = DateFormat.yMMMMd().add_jms().format(DateTime.now());
    _logger.i('Formatted date: $_formatted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Intl & Logger Example')),
      body: Center(child: Text(_formatted)),
    );
  }
}
