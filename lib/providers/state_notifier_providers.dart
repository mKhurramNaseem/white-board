import 'package:riverpod/riverpod.dart';
import 'package:white_board/state_notifiers/canvas_state_notifier.dart';
import 'package:white_board/state_notifiers/color_state_notifier.dart';
import 'package:white_board/state_notifiers/shape_state_notifier.dart';
import 'package:white_board/state_notifiers/stroke_state_notifier.dart';
import 'package:white_board/states/canvas_states.dart';
import 'package:white_board/states/color_states.dart';
import 'package:white_board/states/shape_states.dart';
import 'package:white_board/states/stroke_states.dart';

final colorStateNotifierProvider =
    StateNotifierProvider<ColorStateNotifier, ColorState>(
        (ref) => ColorStateNotifier());
final strokeStateNotifierProvider =
    StateNotifierProvider<StrokeStateNotifier, StrokeState>(
        (ref) => StrokeStateNotifier());
final shapeStateNotifierProvider =
    StateNotifierProvider<ShapeStateNotifier, ShapeState>(
        (ref) => ShapeStateNotifier());
final canvasStateNotifierProvider =
    StateNotifierProvider<CanvasStateNotifier, CanvasState>(
        (ref) => CanvasStateNotifier());
