import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteExamplePage extends StatefulWidget {
  const SqfliteExamplePage({super.key});

  @override
  State<SqfliteExamplePage> createState() => _SqfliteExamplePageState();
}

class _SqfliteExamplePageState extends State<SqfliteExamplePage> {
  int _count = 0;
  Database? _db;

  @override
  void initState() {
    super.initState();
    _initDb();
  }

  Future<void> _initDb() async {
    final path = join(await getDatabasesPath(), 'demo.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE counter(value INTEGER)');
        await db.insert('counter', {'value': 0});
      },
    );
    final result = await _db!.query('counter');
    setState(() {
      _count = result.first['value'] as int;
    });
  }

  Future<void> _increment() async {
    _count++;
    await _db!.update('counter', {'value': _count});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sqflite Example')),
      body: Center(child: Text('Count: $_count')),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
