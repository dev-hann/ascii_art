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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AsciiArt(
          File("assets/example3.png"),
        ),
      ),
    );
  }
}
