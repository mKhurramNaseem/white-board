import 'package:flutter/material.dart';
import 'package:white_board/widgets/board_options.dart';

class ShapeWidget extends StatelessWidget {
  static const shapeText = 'Shape';
  final VoidCallback onPressed;
  const ShapeWidget({super.key , required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return OptionItem(
      icon: const Icon(
        Icons.rectangle_outlined,
      ),
      text: const Text(
        shapeText,
      ),
      onPressed: onPressed,
    );
  }
}
