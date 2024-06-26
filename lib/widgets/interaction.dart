import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/providers/state_notifier_providers.dart';

class Interaction extends ConsumerWidget {
  final Widget child;
  const Interaction({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onPanDown: (details) {
        var canvasStateNotifier =
            ref.read(canvasStateNotifierProvider.notifier);
        var shapeState = ref.read(shapeStateNotifierProvider);
        var colorState = ref.read(colorStateNotifierProvider);
        var strokeState = ref.read(strokeStateNotifierProvider);        
        canvasStateNotifier.onStart(
          details,
          shapeState.shape,
          colorState.color,
          strokeState.stroke,
        );
      },
      onPanUpdate: (details) {
        var canvasStateNotifier =
            ref.read(canvasStateNotifierProvider.notifier);
        canvasStateNotifier.onUpdate(details);
      },
      onPanEnd: (details) {
        var canvasStateNotifier =
            ref.read(canvasStateNotifierProvider.notifier);
        canvasStateNotifier.onEnd(details);
      },
      child: child,
    );
  }
}

class Undo extends ConsumerWidget {
  const Undo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        var canvasStateNotifier =
            ref.read(canvasStateNotifierProvider.notifier);
        canvasStateNotifier.undo();
      },
      icon: const Icon(
        Icons.undo,
      ),
    );
  }
}



class Redo extends ConsumerWidget {
  const Redo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        var canvasStateNotifier =
            ref.read(canvasStateNotifierProvider.notifier);
        canvasStateNotifier.redo();
      },
      icon: const Icon(
        Icons.redo,
      ),
    );
  }
}
