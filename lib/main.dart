import 'package:flutter/material.dart';
import 'package:device_info_example/device_info_example.dart';
import 'package:url_launcher_example/url_launcher_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  
  
  Widget build(BuildContext context) {
    final examples = <String, WidgetBuilder>{
      "Device Info Example": (context) => const DeviceInfoExamplePage(),
      "URL Launcher Example": (context) => const UrlLauncherExamplePage(),
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView(
        children: examples.entries.map((entry) {
          return ListTile(
            title: Text(entry.key),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: entry.value),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

