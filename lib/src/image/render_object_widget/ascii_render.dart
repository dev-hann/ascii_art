import 'package:flutter/material.dart';

class AsciiArtRenderObjectWidget extends LeafRenderObjectWidget {
  const AsciiArtRenderObjectWidget({super.key});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return AsciiArtRenderBox();
  }

  @override
  void updateRenderObject(BuildContext context, AsciiArtRenderBox renderObject) {
    renderObject;
  }
}

class AsciiArtRenderBox extends RenderBox {

}
