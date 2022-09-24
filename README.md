
# Ascii Art
Arcii Art Widget written by flutter.

## Getting started
In the `pubspec.yaml` of your flutter project, add the following dependency:

```
dependencies:
  ...
  ascii_art:
```
In your library add the following import.
```
import 'package:ascii_art/ascii_art.dart';
```

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Example


```dart
  final file = File("filePath");
  AsciiArt(
    file.readAsBytesSync(),
  );
  // OR 
  AsciiArt.file(
    "filePath",
  );
```

more Info [Example](https://github.com/yoehwan/ascii_art/tree/main/example)

