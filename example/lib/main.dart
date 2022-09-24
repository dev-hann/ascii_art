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
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            AsciiArt.file(
              "assets/example1.png",
              selectable: true,
            ),
            AsciiArt.file(
              "assets/example2.png",
              selectable: true,
            ),
            AsciiArt.file(
              "assets/example3.png",
              selectable: true,
            ),
          ],
        ),
      ),
    );
  }
}
