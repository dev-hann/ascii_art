import 'dart:io';

import 'package:ascii_art/ascii_art.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AsciiArtExample",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AsciiArtExample(),
    );
  }
}

class AsciiArtExample extends StatelessWidget {
  const AsciiArtExample({super.key});

  Widget image(String path) {
    return Expanded(
      child: Row(
        children: [
          Expanded(child: Image.asset(path)),
          Expanded(child: AsciiArt.file(path)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            image(
              "assets/example1.png",
            ),
            image(
              "assets/example2.png",
            ),
            image(
              "assets/example3.png",
            ),
          ],
        ),
      ),
    );
  }
}
