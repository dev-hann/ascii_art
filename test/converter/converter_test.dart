import 'dart:typed_data';

import 'package:ascii_art/src/ascii_converter/ascii_converter.dart';
import 'package:ascii_art/src/const/ascii_table.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Converter", () {
    group("Input Test", () {
      test("normal Input", () {
        final data = Uint8List.fromList([1, 2, 3]);
        final c = AsciiConverter(data);
        expect(c.data, data);
      });
      test("empty Input", () {
        final data = Uint8List.fromList([]);
        expect(
          () => AsciiConverter(data),
          throwsAssertionError,
        );
      });
    });
    test("Test Normal Convert", () {
      // final data = Uint8List.fromList(
      //   List.generate(256, (index) => index),
      // );
      // final c = AsciiConverter(data);
      // final res = c.convert();
      // expect(res, asciiTable.join());
    });
    test("Test Reverse Convert", () {
      // final c = AsciiConverter(
      //   [
      //     Int8List.fromList(
      //       List.generate(asciiTable.length, (index) {
      //         return index;
      //       }),
      //     ),
      //   ],
      //   reverse: true,
      // );
      // final res = c.convert();
      // expect(res, asciiTable.reversed.join());
    });
  });
}
