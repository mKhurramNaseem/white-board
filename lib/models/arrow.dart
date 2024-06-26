import 'package:white_board/models/shape.dart';

abstract class Arrow extends Shape{
  Arrow({required super.begin , required super.end , super.color , super.paintingStyle});
}

class ArrowRight extends Arrow{
  ArrowRight({required super.begin , required super.end ,  super.color ,  super.paintingStyle});
}

class ArrowLeft extends Arrow{
  ArrowLeft({required super.begin , required super.end , super.color ,  super.paintingStyle});
}

class ArrowTop extends Arrow{
  ArrowTop({required super.begin , required super.end ,  super.color ,  super.paintingStyle});
}

class ArrowBottom extends Arrow{
  ArrowBottom({required super.begin , required super.end , super.color ,  super.paintingStyle});
}