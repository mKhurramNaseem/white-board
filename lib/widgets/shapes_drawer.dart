import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/providers/state_notifier_providers.dart';
import 'package:white_board/states/shape_states.dart';
import 'package:white_board/widgets/board_options.dart';

class ShapeDrawer extends AnimatedWidget {
  static const _empty = '';
  const ShapeDrawer({super.key, required super.listenable});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: listenable as Animation<double>,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          ShapeItem(
            data: Icons.pentagon_outlined,
            shape: Shapes.pentagon,
            text: _empty,
            listenable: listenable,
          ),
          ShapeItem(
            data: Icons.hexagon_outlined,
            shape: Shapes.hexagon,
            text: _empty,
            listenable: listenable,
          ),
          ShapeItem(
            data: Icons.crop_square_rounded,
            shape: Shapes.rRectangle,
            text: _empty,
            listenable: listenable,
          ),
          ShapeItem(
            data: Icons.change_history,
            shape: Shapes.isocelesTriangle,
            text: _empty,
            listenable: listenable,
          ),
          ShapeItem(
            data: Icons.rectangle_outlined,
            shape: Shapes.rectangle,
            text: _empty,
            listenable: listenable,
          ),
          ShapeItem(
            data: Icons.signal_cellular_null_sharp,
            shape: Shapes.scaleneTriangle,
            text: _empty,
            listenable: listenable,
          ),    
        ],
      ),
    );
  }
}

class ShapeItem extends ConsumerWidget {
  final IconData data;
  final String text;
  final Shapes shape;
  final Listenable listenable;
  const ShapeItem({
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
