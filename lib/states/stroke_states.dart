import 'package:flutter/material.dart';

@immutable
abstract class StrokeState {
  final Strokes stroke;
  const StrokeState({required this.stroke,});
}

@immutable
class StrokeInitialState extends StrokeState {
  const StrokeInitialState({required super.stroke});
}

@immutable
class StrokeUpdatedState extends StrokeState {  
  const StrokeUpdatedState({required super.stroke,});
}

enum Strokes {
  onePx,
  threePx,
  fivePx,
  eightPx,
}
