import 'dart:io';

import 'package:ascii_art/src/ascii_converter/ascii_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _asciiTable = ["M", "a", "o", "c", "(", "|", ";", ":", "'", ".", " "];

class AsciiArt extends StatefulWidget {
  AsciiArt(
    this.data, {
    super.key,
    this.selectable = false,
    this.asciiTable = _asciiTable,
  })  : assert(asciiTable.isNotEmpty, "asciiTable must not be empty"),
        assert(data.isNotEmpty, "data must not be empty");

  AsciiArt.file(
    String path, {
    super.key,
    this.selectable = false,
    this.asciiTable = _asciiTable,
  })  : assert(path.isNotEmpty, "path must not be null"),
        data = File(path).readAsBytesSync();

  final Uint8List data;
  final bool selectable;
  final List<String> asciiTable;

  @override
  State<StatefulWidget> createState() {
    return AsciiArtState();
  }
}

class AsciiArtState extends State<AsciiArt> {
  late AsciiConverter converter;

  final TextStyle style = GoogleFonts.robotoMono(height: 0.5);

  @override
  void initState() {
    super.initState();
    converter = AsciiConverter(
      widget.data,
      table: widget.asciiTable,
    );
  }

  @override
  void didUpdateWidget(AsciiArt oldWidget) {
    if (widget.data != oldWidget.data ||
        widget.asciiTable != oldWidget.asciiTable) {
      converter = AsciiConverter(
        widget.data,
        table: widget.asciiTable,
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  Widget text() {
    final ascii = converter.convert();
    // final ascii = converter.tableTest();
    if (widget.selectable) {
      return InteractiveViewer(
        maxScale: 10,
        child: SelectableText(ascii, style: style),
      );
    }
    return Text(ascii, style: style);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: converter.width.toDouble(),
      height: converter.height.toDouble(),
      child: FittedBox(
        child: text(),
      ),
    );
  }
}
