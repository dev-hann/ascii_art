import 'dart:typed_data';

import 'package:ascii_art/src/const/ascii_table.dart';

class AsciiConverter {
  AsciiConverter(
    this.dataList, {
    this.reverse = false,
  }) : assert(dataList.isNotEmpty, "data must not be empty");

  final List<Int8List> dataList;
  final bool reverse;

  String convert() {
    final table = reverse ? asciiTable.reversed.toList() : asciiTable;
    return dataList.map((data) {
      return data.map((value) => table[value]).join();
    }).join("\n");
  }
}
