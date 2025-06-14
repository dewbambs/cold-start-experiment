import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExamplePage extends StatefulWidget {
  const ImagePickerExamplePage({super.key});

  @override
  State<ImagePickerExamplePage> createState() => _ImagePickerExamplePageState();
}

class _ImagePickerExamplePageState extends State<ImagePickerExamplePage> {
  XFile? _image;

  Future<void> _pick() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null) Image.file(File(_image!.path), height: 100),
            ElevatedButton(onPressed: _pick, child: const Text('Pick Image')),
          ],
        ),
      ),
    );
  }
}
