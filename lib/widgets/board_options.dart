import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/widgets/arrow_drawer.dart';
import 'package:white_board/widgets/arrow_widget.dart';
import 'package:white_board/widgets/color_drawer.dart';
import 'package:white_board/widgets/color_widget.dart';
import 'package:white_board/widgets/pen_widget.dart';
import 'package:white_board/widgets/shape_widget.dart';
import 'package:white_board/widgets/shapes_drawer.dart';
import 'package:white_board/widgets/stroke_drawer.dart';
import 'package:white_board/widgets/stroke_widget.dart';
import 'package:white_board/widgets/text_widget.dart';

class BoardOptions extends ConsumerStatefulWidget {
  const BoardOptions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _BoardOptionsState();
  }
}

class _BoardOptionsState extends ConsumerState<ConsumerStatefulWidget>
    with TickerProviderStateMixin {
  static const duration = Duration(milliseconds: 300);
  late AnimationController shapeController;  
  late AnimationController strokeController;  
  late AnimationController arrowController;
  late AnimationController colorController;

  @override
  void initState() {
    super.initState();
    shapeController = AnimationController(
      vsync: this,
      duration: duration,
    );    
    strokeController = AnimationController(
      vsync: this,
      duration: duration,
    );    
    arrowController = AnimationController(
      vsync: this,
      duration: duration,
    );    
    colorController = AnimationController(
      vsync: this,
      duration: duration,
    );    
  }

  @override
  void dispose() {
    shapeController.dispose();
    strokeController.dispose();
    arrowController.dispose();
    colorController.dispose();
    super.dispose();
  }

  void _onShapePressed(){
    if(shapeController.status == AnimationStatus.completed){
      shapeController.reverse();
    }else if(shapeController.status == AnimationStatus.dismissed){
      shapeController.forward();
    }
  }


  void _onStrokePressed(){
    if(strokeController.status == AnimationStatus.completed){
      strokeController.reverse();
    }else if(strokeController.status == AnimationStatus.dismissed){
      strokeController.forward();
    }
  }

  void _onArrowPressed(){
    if(arrowController.status == AnimationStatus.completed){
      arrowController.reverse();
    }else if(arrowController.status == AnimationStatus.dismissed){
      arrowController.forward();
    }
  }

  
  void _onColorPressed(){
    if(colorController.status == AnimationStatus.completed){
      colorController.reverse();
    }else if(colorController.status == AnimationStatus.dismissed){
      colorController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PenWidget(),
            Row(
              children: [
                ShapeWidget(onPressed: _onShapePressed,),
                ShapeDrawer(listenable: shapeController),
              ],
            ),
            Row(
              children: [
                StrokeWidget(onPressed: _onStrokePressed,),
                StrokeDrawer(listenable: strokeController),
              ],
            ),
            Row(
              children: [
                ColorWidget(onPressed: _onColorPressed,),
                ColorDrawer(listenable: colorController,),
              ],
            ),
            const TextWidget(),
            Row(children: [
              ArrowWidget(onPressed: _onArrowPressed,),
              ArrowDrawer(listenable: arrowController)
            ],),
          ],
        ),
      ],
    );
  }
}

class OptionItem extends StatelessWidget {
  final Icon icon;
  final Text text;
  final VoidCallback onPressed;
  const OptionItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            IconButton(onPressed: onPressed, icon: icon),
            text,
          ],
        ),
      ),
    );
  }
}
