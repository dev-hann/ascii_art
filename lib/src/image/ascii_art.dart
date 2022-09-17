import 'package:flutter/material.dart';

class AsciiArt extends StatefulWidget {
  const AsciiArt({super.key});

  @override
  State<StatefulWidget> createState() {
    return AsciiArtState();
  }
}

class AsciiArtState extends State<AsciiArt> {
  @override
  Widget build(BuildContext context) {
    return const Text("Test");
  }
}
