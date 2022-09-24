import 'dart:typed_data';

import 'package:ascii_art/src/ascii_converter/ascii_converter.dart';
import 'package:flutter_test/flutter_test.dart';

const _defaultTable = ["M", "a", "o", "c", "(", "|", ";", ":", "'", ".", " "];

void main() {
  group("Test Converter", () {
    group("Input Test", () {
      test("decode Image Input", () {
        // final data = Uint8List.fromList([1, 2, 3]);
        // expect(
        //   () => AsciiConverter(
        //     data,
        //     table: _defaultTable,
        //   ),
        //   throwsAssertionError,
        // );
      });
      test("normal Input", () {
        final data = Uint8List.fromList([1, 2, 3, 4, 5, 6]);
        final c = AsciiConverter(
          data,
          table: _defaultTable,
        );
        expect(c.data, data);
      });
      test("empty Data", () {
        final data = Uint8List.fromList([]);
        expect(
          () => AsciiConverter(
            data,
            table: _defaultTable,
          ),
          throwsAssertionError,
        );
      });
      test("empty Table", () {
        final data = Uint8List.fromList([1, 2, 3]);
        expect(
          () => AsciiConverter(
            data,
            table: [],
          ),
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
