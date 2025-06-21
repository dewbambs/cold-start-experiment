import 'package:flutter/material.dart';
import 'dart:async';
import 'package:device_info_example/device_info_example.dart';
import 'package:url_launcher_example/url_launcher_example.dart';
import 'package:hive_example/hive_example.dart';
import 'package:camera_example/camera_example.dart';
import 'package:sqflite_example/sqflite_example.dart';
import 'package:video_player_example/video_player_example.dart';
import 'package:carousel_slider_example/carousel_slider_example.dart';
import 'package:dots_indicator_example/dots_indicator_example.dart';
import 'package:flutter_cache_manager_example/flutter_cache_manager_example.dart';
import 'package:flutter_downloader_example/flutter_downloader_example.dart';
import 'package:flutter_staggered_grid_view_example/flutter_staggered_grid_view_example.dart';
import 'package:flutter_svg_lottie_example/flutter_svg_lottie_example.dart';
import 'package:http_example/http_example.dart' deferred as http_example;
import 'package:image_picker_example/image_picker_example.dart';
import 'package:in_app_review_example/in_app_review_example.dart';
import 'package:get_it_example/get_it_example.dart';
import 'package:intl_logger_example/intl_logger_example.dart';

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
      home: const SplashPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final examples = <String, Future<Widget> Function()>{
      "Device Info Example": () async {
        return const DeviceInfoExamplePage();
      },
      "URL Launcher Example": () async {
        return const UrlLauncherExamplePage();
      },
      "Hive Example": () async {
        return const HiveExamplePage();
      },
      "Camera Example": () async {
        return const CameraExamplePage();
      },
      "Sqflite Example": () async {
        return const SqfliteExamplePage();
      },
      "Video Player Example": () async {
        return const VideoPlayerExamplePage();
      },
      "Carousel Slider Example": () async {
        return const CarouselSliderExamplePage();
      },
      "Dots Indicator Example": () async {
        return const DotsIndicatorExamplePage();
      },
      "Cache Manager Example": () async {
        return const FlutterCacheManagerExamplePage();
      },
      "Downloader Example": () async {
        return const FlutterDownloaderExamplePage();
      },
      "Staggered Grid Example": () async {
        return const FlutterStaggeredGridViewExamplePage();
      },
      "SVG & Lottie Example": () async {
        return const FlutterSvgLottieExamplePage();
      },
      "HTTP Example": () async {
        await http_example.loadLibrary();
        return http_example.HttpExamplePage();
      },
      "Image Picker Example": () async {
        return const ImagePickerExamplePage();
      },
      "In App Review Example": () async {
        return const InAppReviewExamplePage();
      },
      "GetIt Example": () async {
        return const GetItExamplePage();
      },
      "Intl & Logger Example": () async {
        return IntlLoggerExamplePage();
      },
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
            onTap: () async {
              final page = await entry.value();
              if (!context.mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => page),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MyHomePage(
              title: 'Flutter Demo Home Page',
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }
}
