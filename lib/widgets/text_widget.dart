import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/widgets/board_options.dart';

class TextWidget extends ConsumerWidget {
  static const text = 'Text';
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OptionItem(
      icon: const Icon(Icons.text_fields),
      text: const Text(
        text,
      ),
      onPressed: () {},
    );
  }
}
