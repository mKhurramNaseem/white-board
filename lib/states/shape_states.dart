import 'package:flutter/material.dart';

@immutable
abstract class ShapeState {
  final Shapes shape;
  const ShapeState({required this.shape,});
}

@immutable
class ShapeInitialState extends ShapeState {
  const ShapeInitialState({required super.shape});
}

@immutable
class ShapeUpdatedState extends ShapeState { 
  const ShapeUpdatedState({required super.shape,});
}

enum Shapes {  
  line,
  oval,
  rectangle, 
  rRectangle,
  pentagon,
  hexagon,
  scaleneTriangle,
  isocelesTriangle,
  rightArrow,
  leftArrow,
  topArrow,
  bottomArrow,
  diamond,
  customLine,
}
