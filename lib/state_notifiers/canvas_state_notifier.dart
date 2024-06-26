import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:white_board/models/arrow.dart';
import 'package:white_board/models/custom_line.dart';
import 'package:white_board/models/quadrilateral.dart';
import 'package:white_board/models/shape.dart';
import 'package:white_board/models/triangle.dart';
import 'package:white_board/states/canvas_states.dart';
import 'package:white_board/states/shape_states.dart';
import 'package:white_board/states/stroke_states.dart';

class CanvasStateNotifier extends StateNotifier<CanvasState>{

  // To keep trash record
  List<Shape> trashStack = [];

  // To keep record of previous shapes
  List<Shape> previous = [];

  // For all other shapes
  Offset begin = Offset.zero;
  Offset end = Offset.zero;

  // For Custom Line  
  Offset current = Offset.zero; 
  Shape currentShape = Line(begin: Offset.zero, end: Offset.zero);

  CanvasStateNotifier():super(CanvasInitialState());

  onStart(DragDownDetails details , Shapes shape, Color color , Strokes stroke){
    if(shape == Shapes.customLine){
      current = details.globalPosition;      
      currentShape = getRespectiveInstance(shape);                  
      (currentShape as CustomLine).offsets.add(current);
    }else{
      begin = details.globalPosition;
      end = details.globalPosition;      
      currentShape = getRespectiveInstance(shape);      
    }
    currentShape.color = color;
    currentShape.stroke = stroke;
    currentShape.paintingStyle = PaintingStyle.stroke;
    state = CanvasUpdatedState(track: previous, current: currentShape);  
  }

  onUpdate(DragUpdateDetails details){
    if(currentShape is CustomLine){
      current = details.globalPosition;
      (currentShape as CustomLine).offsets.add(current);
    }else{
      end = details.globalPosition; 
      currentShape.end = end;
    }
    state = CanvasUpdatedState(track: previous, current: currentShape);
  }

  onEnd(DragEndDetails details){
    previous.add(currentShape);    
    if(currentShape is CustomLine){
      current = Offset.zero;
    }        
    currentShape = Line(begin: Offset.zero, end: Offset.zero);    
  }

  undo(){
    if(previous.isNotEmpty){
      Shape shape = previous.removeAt(previous.length - 1);
      trashStack.add(shape);
      state = CanvasUpdatedState(track: previous, current: currentShape);
    }
  }

  redo(){
    if(trashStack.isNotEmpty){
      Shape shape = trashStack.removeAt(trashStack.length - 1);
      previous.add(shape);
      state = CanvasUpdatedState(track: previous, current: currentShape);
    }
  }

  Shape getRespectiveInstance(Shapes shape){
    return switch(shape){
      Shapes.line => Line(begin: begin, end: end),
      Shapes.oval => Oval(begin: begin, end: end),
      Shapes.rectangle => Rectangle(begin: begin, end: end),
      Shapes.rRectangle => RRectangle(begin: begin, end: end),
      Shapes.pentagon => Pentagon(begin: begin, end: end),
      Shapes.hexagon => Hexagon(begin: begin, end: end),
      Shapes.isocelesTriangle => Isoceles(begin: begin, end: end),
      Shapes.scaleneTriangle => Scalene(begin: begin, end: end),
      Shapes.topArrow => ArrowTop(begin: begin, end: end),
      Shapes.bottomArrow => ArrowBottom(begin: begin, end: end),
      Shapes.rightArrow => ArrowRight(begin: begin, end: end),
      Shapes.leftArrow => ArrowLeft(begin: begin, end: end),
      Shapes.diamond => Diamond(begin: begin, end: end),
      Shapes.customLine => CustomLine(begin: begin, end: end,offsets: []),      
    };
  }

}