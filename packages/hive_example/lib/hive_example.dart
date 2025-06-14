import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveExamplePage extends StatefulWidget {
  const HiveExamplePage({super.key});

  @override
  State<HiveExamplePage> createState() => _HiveExamplePageState();
}

class _HiveExamplePageState extends State<HiveExamplePage> {
  late Box<int> _box;
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    _box = await Hive.openBox<int>('counterBox');
    setState(() {
      _count = _box.get('count', defaultValue: 0)!;
    });
  }

  Future<void> _increment() async {
    final newCount = _count + 1;
    await _box.put('count', newCount);
    setState(() {
      _count = newCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hive Example')),
      body: Center(child: Text('Count: $_count')),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
