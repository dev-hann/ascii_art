import 'dart:io';

import 'package:ascii_art/src/ascii_converter/ascii_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image/image.dart' as im;

class AsciiArt extends StatefulWidget {
  const AsciiArt(
    this.data, {
    super.key,
  });
  final File data;

  @override
  State<StatefulWidget> createState() {
    return AsciiArtState();
  }
}

class AsciiArtState extends State<AsciiArt> {
  Future<List<Uint8List>> loadData() async {
    final bytes = await widget.data.readAsBytes();
    im.Image? image = im.decodeImage(bytes);
    if (image == null) {
      throw NullThrownError();
    }
    final res = <Uint8List>[];
    try {
      image = im.grayscale(image);
      final w = image.width;
      final h = image.height;
      final imageData = image.getBytes(format: im.Format.luminance);
      for (int line = 0; line < h; line++) {
        final lineData = <int>[];
        for (int index = 0; index < w; index++) {
          final pixel = imageData[(line * w) + index];
          lineData.add(pixel);
        }
        res.add(Uint8List.fromList(lineData));
      }
    } catch (e) {
      print(e);
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Uint8List>>(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        }
        final dataList = snapshot.data!;
        final converter = AsciiConverter(dataList);
        final ascii = converter.convert();
        return InteractiveViewer(
          child: SizedBox(
            width: 500,
            height: 500,
            child: FittedBox(
              child: ColoredBox(
                color: Colors.transparent,
                child: SelectableText(
                  ascii,
                  style: GoogleFonts.robotoMono(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
