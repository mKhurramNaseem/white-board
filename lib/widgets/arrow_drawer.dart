import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/providers/state_notifier_providers.dart';
import 'package:white_board/states/shape_states.dart';
import 'package:white_board/widgets/board_options.dart';

class ArrowDrawer extends AnimatedWidget {
  static const _empty = '';
  const ArrowDrawer({super.key, required super.listenable});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: listenable as Animation<double>,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          ArrowItem(
            data: Icons.arrow_upward,
            shape: Shapes.topArrow,
            text: _empty,
            listenable: listenable,
          ),
          ArrowItem(
            data: Icons.arrow_downward,
            shape: Shapes.bottomArrow,
            text: _empty,
            listenable: listenable,
          ),
          ArrowItem(
            data: Icons.arrow_back,
            shape: Shapes.leftArrow,
            text: _empty,
            listenable: listenable,
          ),
          ArrowItem(
            data: Icons.arrow_forward,
            shape: Shapes.rightArrow,
            text: _empty,
            listenable: listenable,
          ),
        ],
      ),
    );
  }
}

class ArrowItem extends ConsumerWidget {
  final IconData data;
  final String text;
  final Shapes shape;
  final Listenable listenable;
  const ArrowItem({
    super.key,
    required this.data,
    required this.shape,
    required this.text,
    required this.listenable,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OptionItem(
      icon: Icon(data),
      text: Text(text),
      onPressed: () {
        ref.read(shapeStateNotifierProvider.notifier).updateShape(shape);
        (listenable as AnimationController).reverse();
      },
    );
  }
}
