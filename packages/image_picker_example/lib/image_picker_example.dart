import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExamplePage extends StatefulWidget {
  const ImagePickerExamplePage({super.key});

  @override
  State<ImagePickerExamplePage> createState() => _ImagePickerExamplePageState();
}

class _ImagePickerExamplePageState extends State<ImagePickerExamplePage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pick() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Example')),
      body: Center(
        child: _image == null ? const Text('No image') : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pick,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
