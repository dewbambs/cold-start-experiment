import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpExamplePage extends StatefulWidget {
  const HttpExamplePage({super.key});

  @override
  State<HttpExamplePage> createState() => _HttpExamplePageState();
}

class _HttpExamplePageState extends State<HttpExamplePage> {
  String _response = 'Loading...';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final res = await http.get(Uri.parse('https://example.com'));
    setState(() {
      _response = 'Status: ${res.statusCode}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HTTP Example')),
      body: Center(child: Text(_response)),
    );
  }
}
