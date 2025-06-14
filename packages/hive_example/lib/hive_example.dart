import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveExamplePage extends StatefulWidget {
  const HiveExamplePage({super.key});

  @override
  State<HiveExamplePage> createState() => _HiveExamplePageState();
}

class _HiveExamplePageState extends State<HiveExamplePage> {
  String _value = 'Loading...';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await Hive.initFlutter();
    final box = await Hive.openBox('demo');
    await box.put('foo', 'bar');
    setState(() {
      _value = box.get('foo');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hive Example')),
      body: Center(child: Text(_value)),
    );
  }
}
