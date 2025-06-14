import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class UrlLauncherExamplePage extends StatelessWidget {
  const UrlLauncherExamplePage({super.key});
  
  Future<void> _launch() async {
    final uri = Uri.parse('https://flutter.dev');
    if (!await launchUrl(uri)) {
      throw 'Could not launch \$uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('URL Launcher Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: _launch,
          child: const Text('Open flutter.dev'),
        ),
      ),
    );
  }
}
