import 'package:riverpod/riverpod.dart';
import 'package:white_board/states/shape_states.dart';

class ShapeStateNotifier extends StateNotifier<ShapeState>{
  ShapeStateNotifier():super(const ShapeInitialState(shape: Shapes.line,));

  updateShape(Shapes shape){
    state = ShapeUpdatedState(shape: shape);
  }
}