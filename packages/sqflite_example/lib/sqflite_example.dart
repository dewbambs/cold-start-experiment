import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteExamplePage extends StatefulWidget {
  const SqfliteExamplePage({super.key});

  @override
  State<SqfliteExamplePage> createState() => _SqfliteExamplePageState();
}

class _SqfliteExamplePageState extends State<SqfliteExamplePage> {
  String _text = 'Loading...';

  @override
  void initState() {
    super.initState();
    _setup();
  }

  Future<void> _setup() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'demo.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE demo(id INTEGER PRIMARY KEY, value TEXT)',
        );
      },
      version: 1,
    );
    final db = await database;
    await db.insert('demo', {'id': 0, 'value': 'example'},
        conflictAlgorithm: ConflictAlgorithm.replace);
    final result = await db.query('demo');
    setState(() {
      _text = result.first['value'] as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sqflite Example')),
      body: Center(child: Text(_text)),
    );
  }
}
