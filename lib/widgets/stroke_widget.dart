import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/widgets/board_options.dart';

class StrokeWidget extends ConsumerWidget {
  static const  strokeText = 'Stroke';
  final VoidCallback onPressed;
  const StrokeWidget({super.key , required this.onPressed,});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return OptionItem(
          icon: const Icon(
            Icons.circle_outlined,
          ),
          text: const Text(
            strokeText,
          ),
          onPressed: onPressed,
        );
  }
}