import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class FlutterDownloaderExamplePage extends StatefulWidget {
  const FlutterDownloaderExamplePage({super.key});

  @override
  State<FlutterDownloaderExamplePage> createState() => _FlutterDownloaderExamplePageState();
}

class _FlutterDownloaderExamplePageState extends State<FlutterDownloaderExamplePage> {
  String _taskId = '';

  @override
  void initState() {
    super.initState();
    FlutterDownloader.initialize();
  }

  Future<void> _startDownload() async {
    final id = await FlutterDownloader.enqueue(
      url: 'https://speed.hetzner.de/100MB.bin',
      savedDir: '/sdcard/Download',
      showNotification: true,
      openFileFromNotification: true,
    );
    setState(() {
      _taskId = id ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Downloader Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: _startDownload,
          child: Text(_taskId.isEmpty ? 'Start Download' : 'Task: $_taskId'),
        ),
      ),
    );
  }
}
