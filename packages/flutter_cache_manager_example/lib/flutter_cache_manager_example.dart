import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FlutterCacheManagerExamplePage extends StatefulWidget {
  const FlutterCacheManagerExamplePage({super.key});

  @override
  State<FlutterCacheManagerExamplePage> createState() => _FlutterCacheManagerExamplePageState();
}

class _FlutterCacheManagerExamplePageState extends State<FlutterCacheManagerExamplePage> {
  late Future<FileInfo> _file;

  @override
  void initState() {
    super.initState();
    _file = DefaultCacheManager().getFileFromCache('https://flutter.dev/images/flutter-logo-sharing.png')
        .then((value) => value ?? DefaultCacheManager().downloadFile('https://flutter.dev/images/flutter-logo-sharing.png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cache Manager Example')),
      body: FutureBuilder<FileInfo>(
        future: _file,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return Image.file(snapshot.data!.file);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
