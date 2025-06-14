import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpExamplePage extends StatefulWidget {
  const HttpExamplePage({super.key});

  @override
  State<HttpExamplePage> createState() => _HttpExamplePageState();
}

class _HttpExamplePageState extends State<HttpExamplePage> {
  String _data = 'Loading...';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    if (response.statusCode == 200) {
      setState(() {
        _data = jsonDecode(response.body)['title'];
      });
    } else {
      setState(() {
        _data = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HTTP Example')),
      body: Center(child: Text(_data)),
    );
  }
}
