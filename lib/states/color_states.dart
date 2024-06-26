import 'package:flutter/material.dart';

@immutable
abstract class ColorState{ 
  final Color color;
  const ColorState({required this.color});
}

@immutable
class ColorInitialState extends ColorState{
  const ColorInitialState({required super.color});
}

@immutable
class ColorUpdatedState extends ColorState{
  
  const ColorUpdatedState({required super.color});
}