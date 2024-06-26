import 'package:flutter/material.dart';
import 'package:white_board/widgets/board_options.dart';

class ArrowWidget extends StatelessWidget {
  static const arrowsText = 'Arrow';
  final VoidCallback onPressed;
  const ArrowWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OptionItem(
        icon: const Icon(Icons.arrow_forward),
        text: const Text(arrowsText),
        onPressed: onPressed);
  }
}
