import 'package:flutter/material.dart';
import 'package:white_board/states/stroke_states.dart';

abstract class Shape{
  Offset begin;
  Offset end;
  Color color;
  PaintingStyle paintingStyle;
  Strokes stroke;

  Shape({required this.begin , required this.end , this.color = Colors.black , this.paintingStyle = PaintingStyle.stroke,this.stroke = Strokes.onePx,});
}

class Line extends Shape{
  Line({required super.begin , required super.end , super.color , super.paintingStyle});
}

class Oval extends Shape{
  Oval({required super.begin , required super.end , super.color , super.paintingStyle});
}


