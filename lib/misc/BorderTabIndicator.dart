// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BorderTabIndicator extends Decoration {
  BorderTabIndicator({this.tabController, this.colors, this.indicatorHeight})
      : super();

  final TabController tabController;
  final double indicatorHeight;
  final List<Color> colors;

  // @override
  _BorderPainter createBoxPainter([VoidCallback onChanged]) {
    return _BorderPainter(
        this, tabController, colors, indicatorHeight, onChanged);
  }
}

class _BorderPainter extends BoxPainter {
  _BorderPainter(
    this.decoration,
    this.tabController,
    this.colors,
    this.indicatorHeight,
    VoidCallback onChanged,
  )   : assert(decoration != null),
        assert(indicatorHeight >= 0),
        assert(tabController != null),
        assert(colors != null),
        super(onChanged);
  final double indicatorHeight;
  final List<Color> colors;
  final BorderTabIndicator decoration;
  final TabController tabController;

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
    // paint.color = Color.fromARGB(255, 212, 127, 166);
    paint.color = colors[tabController.index % colors.length];
    // hide the moving indicator
    if (tabController.indexIsChanging) {
      paint.color = Color(0x00ffffff);
    }

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(56)),
      paint,
    );
  }
}
