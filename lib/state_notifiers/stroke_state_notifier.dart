import 'package:riverpod/riverpod.dart';
import 'package:white_board/states/stroke_states.dart';

class StrokeStateNotifier extends StateNotifier<StrokeState> {
  StrokeStateNotifier():super(const StrokeInitialState(stroke: Strokes.threePx));

  updateStroke(Strokes stroke){
    state = StrokeUpdatedState(stroke: stroke);
  }
}