import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class AsciiArt extends StatefulWidget {
  const AsciiArt(
    this.path, {
    super.key,
  });
  final String path;
  @override
  State<StatefulWidget> createState() {
    return AsciiArtState();
  }
}

class AsciiArtState extends State<AsciiArt> {
  @override
  void initState() {
    super.initState();
  }

  Future<Uint8List> loadData() {
    return File(widget.path).readAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        }
        return Text("${snapshot.data}");
      },
    );
    // return const AsciiArtRenderObjectWidget();
  }
}
