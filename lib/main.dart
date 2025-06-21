import 'package:flutter/material.dart';
import 'dart:async';
import 'package:device_info_example/device_info_example.dart' deferred as device_info_example;
import 'package:url_launcher_example/url_launcher_example.dart' deferred as url_launcher_example;
import 'package:hive_example/hive_example.dart' deferred as hive_example;
import 'package:camera_example/camera_example.dart' deferred as camera_example;
import 'package:sqflite_example/sqflite_example.dart' deferred as sqflite_example;
import 'package:video_player_example/video_player_example.dart' deferred as video_player_example;
import 'package:carousel_slider_example/carousel_slider_example.dart' deferred as carousel_slider_example;
import 'package:dots_indicator_example/dots_indicator_example.dart' deferred as dots_indicator_example;
import 'package:flutter_cache_manager_example/flutter_cache_manager_example.dart' deferred as flutter_cache_manager_example;
import 'package:flutter_downloader_example/flutter_downloader_example.dart' deferred as flutter_downloader_example;
import 'package:flutter_staggered_grid_view_example/flutter_staggered_grid_view_example.dart' deferred as flutter_staggered_grid_view_example;
import 'package:flutter_svg_lottie_example/flutter_svg_lottie_example.dart' deferred as flutter_svg_lottie_example;
import 'package:http_example/http_example.dart' deferred as http_example;
import 'package:image_picker_example/image_picker_example.dart' deferred as image_picker_example;
import 'package:in_app_review_example/in_app_review_example.dart' deferred as in_app_review_example;
import 'package:get_it_example/get_it_example.dart' deferred as get_it_example;
import 'package:intl_logger_example/intl_logger_example.dart' deferred as intl_logger_example;

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
        await device_info_example.loadLibrary();
        return const device_info_example.DeviceInfoExamplePage();
      },
      "URL Launcher Example": () async {
        await url_launcher_example.loadLibrary();
        return const url_launcher_example.UrlLauncherExamplePage();
      },
      "Hive Example": () async {
        await hive_example.loadLibrary();
        return const hive_example.HiveExamplePage();
      },
      "Camera Example": () async {
        await camera_example.loadLibrary();
        return const camera_example.CameraExamplePage();
      },
      "Sqflite Example": () async {
        await sqflite_example.loadLibrary();
        return const sqflite_example.SqfliteExamplePage();
      },
      "Video Player Example": () async {
        await video_player_example.loadLibrary();
        return const video_player_example.VideoPlayerExamplePage();
      },
      "Carousel Slider Example": () async {
        await carousel_slider_example.loadLibrary();
        return const carousel_slider_example.CarouselSliderExamplePage();
      },
      "Dots Indicator Example": () async {
        await dots_indicator_example.loadLibrary();
        return const dots_indicator_example.DotsIndicatorExamplePage();
      },
      "Cache Manager Example": () async {
        await flutter_cache_manager_example.loadLibrary();
        return const flutter_cache_manager_example.FlutterCacheManagerExamplePage();
      },
      "Downloader Example": () async {
        await flutter_downloader_example.loadLibrary();
        return const flutter_downloader_example.FlutterDownloaderExamplePage();
      },
      "Staggered Grid Example": () async {
        await flutter_staggered_grid_view_example.loadLibrary();
        return const flutter_staggered_grid_view_example.FlutterStaggeredGridViewExamplePage();
      },
      "SVG & Lottie Example": () async {
        await flutter_svg_lottie_example.loadLibrary();
        return const flutter_svg_lottie_example.FlutterSvgLottieExamplePage();
      },
      "HTTP Example": () async {
        await http_example.loadLibrary();
        return const http_example.HttpExamplePage();
      },
      "Image Picker Example": () async {
        await image_picker_example.loadLibrary();
        return const image_picker_example.ImagePickerExamplePage();
      },
      "In App Review Example": () async {
        await in_app_review_example.loadLibrary();
        return const in_app_review_example.InAppReviewExamplePage();
      },
      "GetIt Example": () async {
        await get_it_example.loadLibrary();
        return const get_it_example.GetItExamplePage();
      },
      "Intl & Logger Example": () async {
        await intl_logger_example.loadLibrary();
        return intl_logger_example.IntlLoggerExamplePage();
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

