import 'package:flutter/material.dart';
import 'package:white_board/models/shape.dart';

class CustomLine extends Shape{
  List<Offset> offsets;
  CustomLine({required this.offsets,required super.begin , required super.end , super.color , super.paintingStyle});
}