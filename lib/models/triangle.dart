

import 'package:white_board/models/shape.dart';
 
abstract class Triangle extends Shape{
  Triangle({required super.begin , required super.end , super.color , super.paintingStyle});
}

class Scalene extends Triangle{
  Scalene({required super.begin , required super.end , super.color ,  super.paintingStyle});
}

class Isoceles extends Triangle{
  Isoceles({required super.begin , required super.end , super.color ,  super.paintingStyle});
}