import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/providers/state_notifier_providers.dart';
import 'package:white_board/states/stroke_states.dart';
import 'package:white_board/widgets/board_options.dart';

class StrokeDrawer extends AnimatedWidget {
  const StrokeDrawer({super.key, required super.listenable});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: listenable as Animation<double>,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          StrokeItem(
            data: Icons.circle,
            stroke: Strokes.onePx,
            listenable: listenable,
          ),
          StrokeItem(
            data: Icons.circle,
            stroke: Strokes.threePx,
            listenable: listenable,
          ),
          StrokeItem(
            data: Icons.circle,
            stroke: Strokes.fivePx,
            listenable: listenable,
          ),
          StrokeItem(
            data: Icons.circle,
            stroke: Strokes.eightPx,
            listenable: listenable,
          ),
        ],
      ),
    );
  }
}

class StrokeItem extends ConsumerWidget {
  final IconData data;
  final String text;
  final Strokes stroke;
  final Listenable listenable;
  const StrokeItem({
    super.key,
    required this.data,
    this.text = '',
    required this.stroke,
    required this.listenable,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OptionItem(
      icon: Icon(
        data,
        size: getSize(),
      ),
      text: Text(text),
      onPressed: () {
        ref.read(strokeStateNotifierProvider.notifier).updateStroke(stroke);
        (listenable as AnimationController).reverse();
      },
    );
  }

  double getSize() {
    return switch (stroke) {
      Strokes.onePx => 5,
      Strokes.threePx => 10,
      Strokes.fivePx => 15,
      Strokes.eightPx => 20,
    };
  }
}
