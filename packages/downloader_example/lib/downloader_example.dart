import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class DownloaderExamplePage extends StatefulWidget {
  const DownloaderExamplePage({super.key});

  @override
  State<DownloaderExamplePage> createState() => _DownloaderExampleState();
}

class _DownloaderExampleState extends State<DownloaderExamplePage> {
  String _taskId = '';
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    FlutterDownloader.initialize();
    FlutterDownloader.registerCallback((id, status, progress) {
      if (id == _taskId) {
        setState(() {
          _progress = progress;
        });
      }
    });
  }

  Future<void> _startDownload() async {
    final taskId = await FlutterDownloader.enqueue(
      url: 'https://via.placeholder.com/600',
      savedDir: '/sdcard/Download',
      showNotification: true,
      openFileFromNotification: true,
    );
    setState(() {
      _taskId = taskId ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Downloader Example')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _startDownload,
              child: const Text('Start Download'),
            ),
            Text('Progress: $_progress%'),
          ],
        ),
      ),
    );
  }
}
