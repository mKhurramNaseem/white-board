import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/models/quadrilateral.dart';
import 'package:white_board/models/shape.dart';
import 'package:white_board/painter/canvas_painter.dart';
import 'package:white_board/providers/state_notifier_providers.dart';
import 'package:white_board/states/canvas_states.dart';

class CanvasWidget extends ConsumerWidget {
  const CanvasWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(canvasStateNotifierProvider);
    if (state is CanvasInitialState) {
      return const InitialWidget();
    } else {
      Shape shape = (state as CanvasUpdatedState).current;
      return UpdatedWidget(shape: shape);
    }
  }
}

class InitialWidget extends ConsumerWidget {
  const InitialWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomPaint(
      painter: CanvasPainter(
        shape: Rectangle(begin: Offset.zero, end: Offset.zero),
        track: [],
      ),
    );
  }
}

class UpdatedWidget extends ConsumerWidget {
  final Shape shape;
  const UpdatedWidget({
    super.key,
    required this.shape,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var canvasStateNotifier = ref.read(canvasStateNotifierProvider.notifier);
    return CustomPaint(
      painter: CanvasPainter(shape: shape, track: canvasStateNotifier.previous),
    );
  }
}
