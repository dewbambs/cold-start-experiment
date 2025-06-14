import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoExamplePage extends StatefulWidget {
  const DeviceInfoExamplePage({super.key});

  @override
  State<DeviceInfoExamplePage> createState() => _DeviceInfoExamplePageState();
}

class _DeviceInfoExamplePageState extends State<DeviceInfoExamplePage> {
  String _info = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadInfo();
  }

  Future<void> _loadInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final info = await deviceInfoPlugin.androidInfo;
    setState(() {
      _info = 'Model: ${info.model}\nAndroid Version: ${info.version.release}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Info Example')),
      body: Center(child: Text(_info)),
    );
  }
}
