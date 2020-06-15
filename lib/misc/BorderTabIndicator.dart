// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BorderTabIndicator extends Decoration {
  BorderTabIndicator({this.indicatorHeight}) : super();

  final double indicatorHeight;

  // @override
  _BorderPainter createBoxPainter([VoidCallback onChanged]) {
    return _BorderPainter(this, indicatorHeight, onChanged);
  }
}

class _BorderPainter extends BoxPainter {
  _BorderPainter(
    this.decoration,
    this.indicatorHeight,
    VoidCallback onChanged,
  )   : assert(decoration != null),
        assert(indicatorHeight >= 0),
        super(onChanged);

  final BorderTabIndicator decoration;
  final double indicatorHeight;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final horizontalInset = indicatorHeight;
    final rect = Offset(
            offset.dx + (configuration.size.width / 2) - indicatorHeight / 2,
            18) &
        Size(horizontalInset, indicatorHeight);
    final paint = Paint();
    paint.color = Color.fromARGB(255, 212, 127, 166);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(56)),
      paint,
    );
  }
}
