

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/game_tile.dart';
import '../screens/victory_screen.dart';
import '../utilities/game_controller.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameController gameController = Provider.of<GameController>(context);
    List<GameTile> gameTiles = gameController.gameBoard;
    return SizedBox.square(
      dimension: 300,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gameController.fieldSize,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: gameController.fieldSize * gameController.fieldSize,
        itemBuilder: (context, index) {
          Icon? gameIcon;
          switch (gameTiles[index].tileStatus) {
            case TileStatus.empty:
              gameIcon = null;
              break;
            case TileStatus.cross:
              gameIcon = const Icon(Icons.close);
              break;
            case TileStatus.circle:
              gameIcon = const Icon(Icons.brightness_1_outlined);
              break;
          }
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
            child:SizedBox.expand(child: FittedBox(fit:BoxFit.contain, child: gameIcon)),
          );
        },
      ),
    );
  }
}

