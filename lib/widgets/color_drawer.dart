import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/providers/state_notifier_providers.dart';
import 'package:white_board/theme/paint_colors.dart';

class ColorDrawer extends AnimatedWidget {
  const ColorDrawer({super.key, required super.listenable});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: listenable as Animation<double>,
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColorItem(
            color: PaintColors.blue,
            listenable: listenable,
          ),
          ColorItem(
            color: PaintColors.red,
            listenable: listenable,
          ),
          ColorItem(
            color: PaintColors.grey,
            listenable: listenable,
          ),
          ColorItem(
            color: PaintColors.pruple,
            listenable: listenable,
          ),
          ColorItem(
            color: PaintColors.orange,
            listenable: listenable,
          ),
          ColorItem(
            color: PaintColors.darkYellow,
            listenable: listenable,
          ),
          ColorItem(
            color: PaintColors.pink,
            listenable: listenable,
          ),
          ColorItem(
            color: PaintColors.brown,
            listenable: listenable,
          ),
        ],
      ),
    );
  }
}

class ColorItem extends ConsumerWidget {
  static const widthPercent = 0.03 , padding = 5.0;
  final Color color;
  final Listenable listenable;
  const ColorItem({
    super.key,
    required this.color,
    required this.listenable,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(colorStateNotifierProvider.notifier).updateColor(color);
        (listenable as AnimationController).reverse();
      },
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: CircleAvatar(
          radius: MediaQuery.sizeOf(context).width * widthPercent,
          backgroundColor: color,
        ),
      ),
    );
  }
}
