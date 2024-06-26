import 'package:white_board/models/shape.dart';

abstract class Quadrilateral extends Shape{
  Quadrilateral({required super.begin , required super.end , super.color , super.paintingStyle});
}


class Rectangle extends Quadrilateral{
  Rectangle({required super.begin , required super.end ,  super.color , super.paintingStyle});
}

class RRectangle extends Quadrilateral{
  RRectangle({required super.begin , required super.end ,  super.color , super.paintingStyle});
}

class Hexagon extends Quadrilateral{
  Hexagon({required super.begin , required super.end ,  super.color , super.paintingStyle});
}

class Pentagon extends Quadrilateral{
  Pentagon({required super.begin , required super.end , super.color , super.paintingStyle});
}

class Diamond extends Quadrilateral{
  Diamond({required super.begin , required super.end , super.color , super.paintingStyle});
}
