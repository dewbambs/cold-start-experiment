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
import 'package:http_example/http_example.dart';
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
    final examples = <String, WidgetBuilder>{
      "Device Info Example": (context) => const DeviceInfoExamplePage(),
      "URL Launcher Example": (context) => const UrlLauncherExamplePage(),
      "Hive Example": (context) => const HiveExamplePage(),
      "Camera Example": (context) => const CameraExamplePage(),
      "Sqflite Example": (context) => const SqfliteExamplePage(),
      "Video Player Example": (context) => const VideoPlayerExamplePage(),
      "Carousel Slider Example": (context) => const CarouselSliderExamplePage(),
      "Dots Indicator Example": (context) => const DotsIndicatorExamplePage(),
      "Cache Manager Example": (context) => const FlutterCacheManagerExamplePage(),
      "Downloader Example": (context) => const FlutterDownloaderExamplePage(),
      "Staggered Grid Example": (context) => const FlutterStaggeredGridViewExamplePage(),
      "SVG & Lottie Example": (context) => const FlutterSvgLottieExamplePage(),
      "HTTP Example": (context) => const HttpExamplePage(),
      "Image Picker Example": (context) => const ImagePickerExamplePage(),
      "In App Review Example": (context) => const InAppReviewExamplePage(),
      "GetIt Example": (context) => const GetItExamplePage(),
      "Intl & Logger Example": (context) => IntlLoggerExamplePage(),
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

