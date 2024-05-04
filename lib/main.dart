import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tflite_audio/tflite_audio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    TfliteAudio.loadModel(
      // numThreads: this.numThreads,
      // isAsset: this.isAsset,
      // outputRawScores: outputRawScores,
      inputType: 'decidedWav',
      model: 'assets/chainsaw_detection.tflite',
      label: 'assets/label.txt',
    );
  }

  String getPrediction() {
    dynamic result = TfliteAudio.startAudioRecognition(
      sampleRate: sampleRate,
      bufferSize: bufferSize,
    );
    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return firstPage;
  }
}

MaterialApp firstPage = MaterialApp(
  title: 'Chainsaw',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      primaryColor: Colors.amber),
  home: Scaffold(
    appBar: AppBar(
      title: const Text('Chainsaw detection'),
    ),
    body: const Center(
      child: Text('Chainsaw'),
    ),
  ),
);
