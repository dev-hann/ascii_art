import 'dart:typed_data';

import 'package:ascii_art/src/ascii_converter/ascii_converter.dart';
import 'package:ascii_art/src/const/ascii_table.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("Test Converter", () {
    group("Input Test", () {
      test("normal Input", () {
        final c = AsciiConverter([
          Int8List.fromList([123])
        ]);
        expect(c.dataList, [
          [123],
        ]);
      });
      test("empty Input", () {
        expect(
          () => AsciiConverter([]),
          throwsAssertionError,
        );
      });
    });
    group("Test Convert", () {
      test("Test Normal Convert", () {
        final c = AsciiConverter([
          Int8List.fromList(
            List.generate(asciiTable.length, (index) {
              return index;
            }),
          ),
        ]);
        final res = c.convert();
        expect(res, asciiTable.join());
      });
      test("Test Reverse Convert", () {
        final c = AsciiConverter(
          [
            Int8List.fromList(
              List.generate(asciiTable.length, (index) {
                return index;
              }),
            ),
          ],
          reverse: true,
        );
        final res = c.convert();
        expect(res, asciiTable.reversed.join());
      });
    });
  });
}
