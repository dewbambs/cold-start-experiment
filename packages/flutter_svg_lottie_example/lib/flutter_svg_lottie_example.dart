import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class FlutterSvgLottieExamplePage extends StatelessWidget {
  const FlutterSvgLottieExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SVG & Lottie Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.network('https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/android.svg', height: 100),
          const SizedBox(height: 20),
          Lottie.network('https://assets10.lottiefiles.com/packages/lf20_iwmd6pyr.json', height: 100),
        ],
      ),
    );
  }
}
