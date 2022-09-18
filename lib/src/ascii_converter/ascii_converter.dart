import 'dart:typed_data';

import 'package:ascii_art/src/const/ascii_table.dart';

class AsciiConverter {
  AsciiConverter(
    this.dataList, {
    this.reverse = false,
  }) : assert(dataList.isNotEmpty, "data must not be empty");

  final List<Uint8List> dataList;
  final bool reverse;

  String convert() {
    final table = reverse ? asciiTable.reversed.toList() : asciiTable;
    final res = dataList.map((data) {
      return data.map((value) {
        final normalizedIndex = (value / 256 * (table.length - 1)).round();
        return table[normalizedIndex];
      }).join();
    }).join("\n");
    return res;
  }
}
