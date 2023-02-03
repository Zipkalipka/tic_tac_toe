import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/victory_screen.dart';
import '../utilities/game_controller.dart';

class TileBody extends StatelessWidget {
  final Widget child;
  final GameScreen screen;
  final int index;

  const TileBody(
      {Key? key,
        required this.child,
        required this.screen,
        required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (screen == GameScreen.victory) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5)),
          ),
          child
        ],
      );
    } else {
      GameController gameController =
      Provider.of<GameController>(context, listen: false);
      return ElevatedButton(
        style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {
          if (gameController.gameState != GameState.newGame) {
            gameController.updateTile(index);
            if (gameController.gameState == GameState.ended) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => const VictoryScreen());
            }
          }
        },
        child: child,
      );
    }
  }
}