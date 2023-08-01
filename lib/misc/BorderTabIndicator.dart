// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BorderTabIndicator extends Decoration {
  BorderTabIndicator({required this.tabController, required this.colors, required this.indicatorHeight})
      : super();

  final TabController tabController;
  final double indicatorHeight;
  final List<Color> colors;

   @override
  _BorderPainter createBoxPainter([VoidCallback? onChanged]) {
    return _BorderPainter(
        this, tabController, colors, indicatorHeight, onChanged!);
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
          offset.dx + (configuration.size!.width / 2) - indicatorHeight / 2,
          18,
        ) &
        Size(horizontalInset, indicatorHeight);
    final paint = Paint();
    paint.color = Color(0xffffffff);

    paint.color = colors[tabController.index % colors.length];

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(56)),
      paint,
    );
  }
}
