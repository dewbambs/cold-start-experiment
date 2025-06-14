import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CacheManagerExamplePage extends StatefulWidget {
  const CacheManagerExamplePage({super.key});

  @override
  State<CacheManagerExamplePage> createState() => _CacheManagerExamplePageState();
}

class _CacheManagerExamplePageState extends State<CacheManagerExamplePage> {
  File? _file;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final file = await DefaultCacheManager().getSingleFile(
      'https://flutter.dev/images/flutter-logo-sharing.png',
    );
    setState(() {
      _file = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cache Manager Example')),
      body: Center(
        child: _file == null
            ? const CircularProgressIndicator()
            : Image.file(_file!),
      ),
    );
  }
}
