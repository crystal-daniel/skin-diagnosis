import 'package:flutter/material.dart';

import '../widgets/image_input.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  Widget? content;
  ImageInput res = const ImageInput();
  @override
  Widget build(context) {
    content = const ImageInput();
    return content!;
  }
}
