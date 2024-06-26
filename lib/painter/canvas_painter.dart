import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:white_board/models/arrow.dart';
import 'package:white_board/models/custom_line.dart';
import 'package:white_board/models/quadrilateral.dart';
import 'package:white_board/models/shape.dart';
import 'package:white_board/models/triangle.dart';
import 'package:white_board/states/stroke_states.dart';

class CanvasPainter extends CustomPainter {
  static const _borderRadius = 20.0;

  final List<Shape> track;
  final Shape shape;

  CanvasPainter({
    required this.shape,
    required this.track,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < track.length; i++) {
      drawRespectiveShape(canvas, track[i]);
    }
    drawRespectiveShape(canvas, shape);
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CanvasPainter oldDelegate) => false;

  drawTrack(Canvas canvas) {}

  drawRespectiveShape(Canvas canvas, Shape shape) {
    if (shape is Line) {
      drawLine(canvas, shape);
    } else if (shape is Oval) {
      drawOval(canvas, shape);
    } else if (shape is Rectangle) {
      drawRectangle(canvas, shape);
    } else if (shape is RRectangle) {
      drawRRectangle(canvas, shape);
    } else if (shape is Pentagon) {
      drawPentagon(canvas, shape);
    } else if (shape is Hexagon) {
      drawHexagon(canvas, shape);
    } else if (shape is Isoceles) {
      drawIsocelesTriangle(canvas, shape);
    } else if (shape is Scalene) {
      drawScaleneTriangle(canvas, shape);
    } else if (shape is ArrowTop) {
      drawTopArrow(canvas, shape);
    } else if (shape is ArrowBottom) {
      drawBottomArrow(canvas, shape);
    } else if (shape is ArrowRight) {
      drawRightArrow(canvas, shape);
    } else if (shape is ArrowLeft) {
      drawLeftArrow(canvas, shape);
    } else if (shape is CustomLine) {
      drawCustomLine(canvas, shape);
    } else if (shape is Diamond) {
      drawDiamond(canvas, shape);
    }
  }

  drawLine(Canvas canvas, Line line) {
    double strokeWidth = getValueFromStrokePixel(line.stroke);
    Paint paint = Paint()
      ..color = line.color
      ..strokeWidth = strokeWidth
      ..style = line.paintingStyle;      
    canvas.drawLine(line.begin, line.end, paint);
  }

  drawOval(Canvas canvas, Oval oval) {
    double strokeWidth = getValueFromStrokePixel(oval.stroke);
    Paint paint = Paint()
      ..color = oval.color
      ..strokeWidth = strokeWidth
      ..style = oval.paintingStyle;
    canvas.drawOval(Rect.fromPoints(oval.begin, oval.end), paint);
  }

  drawRectangle(Canvas canvas, Rectangle rectangle) {
    double strokeWidth = getValueFromStrokePixel(rectangle.stroke);
    Paint paint = Paint()
      ..color = rectangle.color
      ..strokeWidth = strokeWidth
      ..style = rectangle.paintingStyle;
    canvas.drawRect(Rect.fromPoints(rectangle.begin, rectangle.end), paint);
  }

  drawRRectangle(Canvas canvas, RRectangle rRectangle) {
    double strokeWidth = getValueFromStrokePixel(rRectangle.stroke);
    Paint paint = Paint()
      ..color = rRectangle.color
      ..strokeWidth = strokeWidth
      ..style = rRectangle.paintingStyle;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromPoints(rRectangle.begin, rRectangle.end),
            const Radius.circular(_borderRadius)),
        paint);
  }

  drawPentagon(Canvas canvas, Pentagon pentagon) {
    double strokeWidth = getValueFromStrokePixel(pentagon.stroke);
    Paint paint = Paint()
      ..color = pentagon.color
      ..strokeWidth = strokeWidth
      ..style = pentagon.paintingStyle;      
    Rect rect = Rect.fromPoints(pentagon.begin, pentagon.end);
    final topCenter = rect.topCenter;
    final centerRight = rect.centerRight;
    final centerLeft = rect.centerLeft;
    final bottomLeft = getMidPoint(rect.bottomLeft, rect.bottomCenter);
    final bottomRight = getMidPoint(rect.bottomCenter, rect.bottomRight);
    Path path = Path()
      ..moveTo(topCenter.dx, topCenter.dy)
      ..lineTo(centerLeft.dx, centerLeft.dy)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy)
      ..lineTo(centerRight.dx, centerRight.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  drawHexagon(Canvas canvas, Hexagon hexagon) {
    double strokeWidth = getValueFromStrokePixel(hexagon.stroke);
    Paint paint = Paint()
      ..color = hexagon.color
      ..strokeWidth = strokeWidth
      ..style = hexagon.paintingStyle;
    Rect rect = Rect.fromPoints(hexagon.begin, hexagon.end);
    final topCenter = rect.topCenter;
    final bottomCenter = rect.bottomCenter;
    final rightFirst = getMidPoint(rect.topRight, rect.centerRight);
    final rightSecond = getMidPoint(rect.centerRight, rect.bottomRight);
    final leftFirst = getMidPoint(rect.topLeft, rect.centerLeft);
    final leftSecond = getMidPoint(rect.centerLeft, rect.bottomLeft);
    Path path = Path()
      ..moveTo(topCenter.dx, topCenter.dy)
      ..lineTo(leftFirst.dx, leftFirst.dy)
      ..lineTo(leftSecond.dx, leftSecond.dy)
      ..lineTo(bottomCenter.dx, bottomCenter.dy)
      ..lineTo(rightSecond.dx, rightSecond.dy)
      ..lineTo(rightFirst.dx, rightFirst.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  drawIsocelesTriangle(Canvas canvas, Isoceles isoceles) {
    double strokeWidth = getValueFromStrokePixel(isoceles.stroke);
    Paint paint = Paint()
      ..color = isoceles.color
      ..strokeWidth = strokeWidth
      ..style = isoceles.paintingStyle;
    Rect rect = Rect.fromPoints(isoceles.begin, isoceles.end);
    final topCenter = rect.topCenter;
    final bottomLeft = rect.bottomLeft;
    final bottomRight = rect.bottomRight;
    Path path = Path()
      ..moveTo(topCenter.dx, topCenter.dy)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  drawScaleneTriangle(Canvas canvas, Scalene scalene) {
    double strokeWidth = getValueFromStrokePixel(scalene.stroke);
    Paint paint = Paint()
      ..color = scalene.color
      ..strokeWidth = strokeWidth
      ..style = scalene.paintingStyle;
    Rect rect = Rect.fromPoints(scalene.begin, scalene.end);
    final topLeft = rect.topLeft;
    final bottomLeft = rect.bottomLeft;
    final bottomRight = rect.bottomRight;
    Path path = Path()
      ..moveTo(topLeft.dx, topLeft.dy)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  drawDiamond(Canvas canvas, Diamond diamond) {
    double strokeWidth = getValueFromStrokePixel(diamond.stroke);
    Paint paint = Paint()
      ..color = diamond.color
      ..strokeWidth = strokeWidth
      ..style = diamond.paintingStyle;
    Rect rect = Rect.fromPoints(diamond.begin, diamond.end);
    final topCenter = rect.topCenter;
    final centerLeft = rect.centerLeft;
    final centerRight = rect.centerRight;
    final bottomCenter = rect.bottomCenter;
    Path path = Path()
      ..moveTo(topCenter.dx, topCenter.dy)
      ..lineTo(centerLeft.dx, centerLeft.dy)
      ..lineTo(bottomCenter.dx, bottomCenter.dy)
      ..lineTo(centerRight.dx, centerRight.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  drawCustomLine(Canvas canvas, CustomLine customLine) {
    double strokeWidth = getValueFromStrokePixel(customLine.stroke);
    Paint paint = Paint()
      ..color = customLine.color
      ..strokeWidth = strokeWidth
      ..style = customLine.paintingStyle;
    PointMode pointMode = PointMode.polygon;
    canvas.drawPoints(pointMode, customLine.offsets, paint);
  }

  drawTopArrow(Canvas canvas, ArrowTop arrowTop) {
    double strokeWidth = getValueFromStrokePixel(arrowTop.stroke);
    Paint paint = Paint()
      ..color = arrowTop.color
      ..strokeWidth = strokeWidth
      ..style = arrowTop.paintingStyle;
    Rect rect = Rect.fromPoints(arrowTop.begin, arrowTop.end);
    final topCenter = rect.topCenter;
    final centerLeft = rect.centerLeft;
    final centerRight = rect.centerRight;
    final bottomFirstLeft = getMidPoint(rect.bottomLeft, rect.bottomCenter);
    final innerLeft = Offset(bottomFirstLeft.dx, centerLeft.dy);
    final bottomSecondRight = getMidPoint(rect.bottomCenter, rect.bottomRight);
    final innerRight = Offset(bottomSecondRight.dx, centerRight.dy);
    Path path = Path()
      ..moveTo(topCenter.dx, topCenter.dy)
      ..lineTo(centerLeft.dx, centerLeft.dy)
      ..lineTo(innerLeft.dx, innerLeft.dy)
      ..lineTo(bottomFirstLeft.dx, bottomFirstLeft.dy)
      ..lineTo(bottomSecondRight.dx, bottomSecondRight.dy)
      ..lineTo(innerRight.dx, innerRight.dy)
      ..lineTo(centerRight.dx, centerRight.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  drawBottomArrow(Canvas canvas, ArrowBottom arrowBottom) {
    double strokeWidth = getValueFromStrokePixel(arrowBottom.stroke);
    Paint paint = Paint()
      ..color = arrowBottom.color
      ..strokeWidth = strokeWidth
      ..style = arrowBottom.paintingStyle;
    Rect rect = Rect.fromPoints(arrowBottom.begin, arrowBottom.end);
    final bottomCenter = rect.bottomCenter;
    final centerLeft = rect.centerLeft;
    final centerRight = rect.centerRight;
    final topFirstLeft = getMidPoint(rect.topLeft, rect.topCenter);
    final innerLeft = Offset(topFirstLeft.dx, centerLeft.dy);
    final topSecondRight = getMidPoint(rect.topCenter, rect.topRight);
    final innerRight = Offset(topSecondRight.dx, centerRight.dy);
    Path path = Path()
      ..moveTo(bottomCenter.dx, bottomCenter.dy)
      ..lineTo(centerLeft.dx, centerLeft.dy)
      ..lineTo(innerLeft.dx, innerLeft.dy)
      ..lineTo(topFirstLeft.dx, topFirstLeft.dy)
      ..lineTo(topSecondRight.dx, topSecondRight.dy)
      ..lineTo(innerRight.dx, innerRight.dy)
      ..lineTo(centerRight.dx, centerRight.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  drawLeftArrow(Canvas canvas, ArrowLeft arrowLeft) {
    double strokeWidth = getValueFromStrokePixel(arrowLeft.stroke);
    Paint paint = Paint()
      ..color = arrowLeft.color
      ..strokeWidth = strokeWidth
      ..style = arrowLeft.paintingStyle;
    Rect rect = Rect.fromPoints(arrowLeft.begin, arrowLeft.end);
    final centerLeft = rect.centerLeft;
    final topCenter = rect.topCenter;
    final bottomCenter = rect.bottomCenter;
    final rightFirstUp = getMidPoint(rect.topRight, rect.centerRight);
    final innerTop = Offset(
      topCenter.dx,
      rightFirstUp.dy,
    );
    final rightSecondDown = getMidPoint(rect.centerRight, rect.bottomRight);
    final innerBottom = Offset(
      bottomCenter.dx,
      rightSecondDown.dy,
    );
    Path path = Path()
      ..moveTo(centerLeft.dx, centerLeft.dy)
      ..lineTo(topCenter.dx, topCenter.dy)
      ..lineTo(innerTop.dx, innerTop.dy)
      ..lineTo(rightFirstUp.dx, rightFirstUp.dy)
      ..lineTo(rightSecondDown.dx, rightSecondDown.dy)
      ..lineTo(innerBottom.dx, innerBottom.dy)
      ..lineTo(bottomCenter.dx, bottomCenter.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  drawRightArrow(Canvas canvas, ArrowRight arrowRight) {
    double strokeWidth = getValueFromStrokePixel(arrowRight.stroke);
    Paint paint = Paint()
      ..color = arrowRight.color
      ..strokeWidth = strokeWidth
      ..style = arrowRight.paintingStyle;
    Rect rect = Rect.fromPoints(arrowRight.begin, arrowRight.end);
    final centerRight = rect.centerRight;
    final topCenter = rect.topCenter;
    final bottomCenter = rect.bottomCenter;
    final leftFirstUp = getMidPoint(rect.topLeft, rect.centerLeft);
    final innerTop = Offset(
      topCenter.dx,
      leftFirstUp.dy,
    );
    final leftSecondDown = getMidPoint(rect.centerLeft, rect.bottomLeft);
    final innerBottom = Offset(
      bottomCenter.dx,
      leftSecondDown.dy,
    );
    Path path = Path()
      ..moveTo(centerRight.dx, centerRight.dy)
      ..lineTo(topCenter.dx, topCenter.dy)
      ..lineTo(innerTop.dx, innerTop.dy)
      ..lineTo(leftFirstUp.dx, leftFirstUp.dy)
      ..lineTo(leftSecondDown.dx, leftSecondDown.dy)
      ..lineTo(innerBottom.dx, innerBottom.dy)
      ..lineTo(bottomCenter.dx, bottomCenter.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  Offset getMidPoint(Offset first, Offset second) {
    double x = (first.dx + second.dx) / 2;
    double y = (first.dy + second.dy) / 2;
    return Offset(x, y);
  }

  double getValueFromStrokePixel(Strokes stroke) {
    return switch (stroke) {
      Strokes.onePx => 5.0,
      Strokes.threePx => 10.0,
      Strokes.fivePx => 15.0,
      Strokes.eightPx => 20.0,
    };
  }
}
