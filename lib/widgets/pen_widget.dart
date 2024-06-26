import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/providers/state_notifier_providers.dart';
import 'package:white_board/states/shape_states.dart';
import 'package:white_board/widgets/board_options.dart';

class PenWidget extends ConsumerWidget {
  static const penText = 'Pen';
  const PenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OptionItem(
      icon: const Icon(
        Icons.edit_outlined,
      ),
      text: const Text(
        penText,
      ),
      onPressed: () {
        ref
            .read(shapeStateNotifierProvider.notifier)
            .updateShape(Shapes.customLine);
      },
    );
  }
}
