
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utilities/design_constants.dart';
import '../utilities/game_controller.dart';

class BottomPlayMode extends StatelessWidget {
  const BottomPlayMode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GameController gameController = Provider.of<GameController>(context);
    return Column(children: [
      const SizedBox(
        height: 100,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100),padding: EdgeInsets.zero),
        onPressed: () {
          gameController.resetBoard();
        },
        onLongPress: () {
          gameController.startNewGame();
        },
        child: Text('Press to Restart\nHold for a New Game',
          style: customTextStyle(25),textAlign: TextAlign.center,),
      ),
    ]
    );
  }
}
