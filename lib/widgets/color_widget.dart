import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/widgets/board_options.dart';

class ColorWidget extends ConsumerWidget {
  static const colorText = 'Color';
  final VoidCallback onPressed ;
  const ColorWidget({super.key , required this.onPressed,});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return OptionItem(
          icon: const Icon(
            Icons.color_lens_outlined,
          ),
          text: const Text(
            colorText,
          ),
          onPressed: onPressed,
        );
  }
}