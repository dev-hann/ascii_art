import 'dart:io';

import 'package:ascii_art/src/ascii_converter/ascii_converter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    final converter = AsciiConverter(widget.data.readAsBytesSync());
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
  }
}
