import 'dart:math';
import 'dart:typed_data';
import 'package:image/image.dart' as im;

class AsciiConverter {
  AsciiConverter(
    this.data, {
    required List<String> table,
    this.reverse = false,
  })  : assert(data.isNotEmpty, "data must not be empty"),
        assert(table.isNotEmpty, "table must not be empty"),
        table = reverse ? table.reversed.toList() : table,
        decodeImage = im.decodeImage(data);

  final Uint8List data;
  final bool reverse;
  final im.Image? decodeImage;
  final List<String> table;
  int get width {
    final img = decodeImage;
    if (img == null) {
      return 0;
    }
    return img.width;
  }

  int get height {
    final img = decodeImage;
    if (img == null) {
      return 0;
    }
    return img.height;
  }

  String convert() {
    im.Image? image = decodeImage;
    if (image == null) {
      // TODO: Throw Exception
      return "";
    }
    image = im.copyResize(image, width: image.width ~/ 3);
    int w = image.width;
    int h = image.height;
    final bytes = image.getBytes(format: im.Format.luminance);
    final buffer = StringBuffer();
    for (int offsetY = 0; offsetY < h; offsetY++) {
      for (int offsetX = 0; offsetX < w; offsetX++) {
        final pixel = bytes[offsetY * w + offsetX];
        final index = ((pixel / (pow(2, 8) - 1)) * (table.length - 1)).round();
        final char = table[index];
        buffer.write(char);
      }
      buffer.write("\n");
    }
    final res = buffer.toString();
    return res;
  }

  String tableTest() {
    final buffer = StringBuffer();
    for (final char in table) {
      for (int index = 0; index < 30; index++) {
        buffer.writeln(char * 100);
      }
    }
    return buffer.toString();
  }
}
