import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/widgets/board_options.dart';
import 'package:white_board/widgets/canvas_widget.dart';
import 'package:white_board/widgets/interaction.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Interaction(
            child: BoardBody(),
          ),
        ),
        floatingActionButton: ButtonBar(
          children: [
            Undo(),
            Redo(),
          ],
        ),
      ),
    );
  }
}

class BoardBody extends StatefulWidget {
  const BoardBody({super.key});

  @override
  State<BoardBody> createState() => _BoardBodyState();
}

class _BoardBodyState extends State<BoardBody> {  

  @override
  void initState() {
    super.initState();    
  }

  @override
  void dispose() {    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SizedBox.expand(
          child: CanvasWidget(),
        ),
        BoardOptions(),        
      ],
    );
  }
}
