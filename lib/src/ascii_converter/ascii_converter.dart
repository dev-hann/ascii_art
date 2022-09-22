import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:image/image.dart' as im;
import 'package:ascii_art/src/const/ascii_table.dart';

class AsciiConverter {
  AsciiConverter(
    this.data, {
    this.reverse = false,
  }) : assert(data.isNotEmpty, "data must not be empty");

  factory AsciiConverter.file(
    String path, {
    bool reverse = false,
  }) {
    final file = File(path);
    return AsciiConverter(
      file.readAsBytesSync(),
      reverse: reverse,
    );
  }

  final Uint8List data;
  final bool reverse;

  im.Image? get decodeImage => im.decodeImage(data);

  String convert() {
    final table = reverse ? asciiTable.reversed.toList() : asciiTable;
    final image = decodeImage;
    if (image == null) {
      // TODO: Throw Exception
      return "";
    }
    final w = image.width;
    final h = image.height;

    final buffer = StringBuffer();
    for (int offsetY = 0; offsetY < h; offsetY++) {
      for (int offsetX = 0; offsetX < w; offsetX++) {
        final pixel = image.getPixel(offsetX, offsetY);
        final index = ((pixel / pow(2, 32)) * (table.length - 1)).round();
        buffer.write(table[index]);
      }
      buffer.write("\n");
    }
    return buffer.toString();
  }
}
